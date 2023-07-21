class SportsController < ApplicationController


 def index
    sports = Sport.includes(:sport_media_videos, :players) # Include players association
    sports_data = sports.map do |sport|
      {
        id: sport.id,
        name: sport.name,
        sport_media_videos: sport.sport_media_videos,
        players: sport.players.map do |player| # Include player details
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

    render json: sports_data, status: :ok
  end

 def show
    sport = Sport.find(params[:id])
    sport_media_videos = sport.sport_media_videos
    players = Player.where(sport_id: sport.id) # Get all players belonging to this sport
    players_data = players.map do |player|
      {
        id: player.id,
        first_name: player.first_name,
        last_name: player.last_name,
        image_url: player.image.attached? ? url_for(player.image) : nil,
        statistics: player.statistics,
        videos: player.videos
      }
    end

    render json: { sport: sport, sport_media_videos: sport_media_videos, players: players_data }, status: :ok
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
