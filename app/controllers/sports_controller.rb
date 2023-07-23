class SportsController < ApplicationController
  # ...

  def index
    sports = Sport.includes(teams: [:players, :sport_media_videos]) # Include teams and players associations
    sports_data = sports.map do |sport|
      {
        id: sport.id,
        name: sport.name,
        sport_media_videos: sport.sport_media_videos,
        teams: sport.teams.map do |team|
          {
            id: team.id,
            name: team.name,
            players: team.players.map do |player|
              {
                id: player.id,
                first_name: player.first_name,
                last_name: player.last_name,
                image_url: player.image.attached? ? url_for(player.image) : nil,
                statistics: player.statistics,
                videos: player.videos
              }
            end
          }
        end
      }
    end

    render json: sports_data, status: :ok
  end


  def show
    sport = Sport.find(params[:id])
    sport_media_videos = sport.sport_media_videos
    teams = sport.teams.includes(:players) # Include players association for each team
    teams_data = teams.map do |team|
      {
        id: team.id,
        name: team.name,
        players: team.players.map do |player|
          {
            id: player.id,
            first_name: player.first_name,
            last_name: player.last_name,
            image_url: player.image.attached? ? url_for(player.image) : nil,
            statistics: player.statistics,
            videos: player.videos
          }
        end
      }
    end

    render json: { sport: sport, sport_media_videos: sport_media_videos, teams: teams_data }, status: :ok
  end


  def create
    sport = Sport.new(sport_params)
    if sport.save
      render json: sport, status: :created
    else
      render json: sport.errors, status: :unprocessable_entity
    end
  end

  def update
    sport = Sport.find(params[:id])
    if sport.update(sport_params)
      render json: sport, status: :ok
    else
      render json: sport.errors, status: :unprocessable_entity
    end
  end

  def destroy
    sport = Sport.find(params[:id])
    sport.destroy
    head :no_content
  end



  private

  def sport_params
    params.require(:sport).permit(:name)
  end
end
