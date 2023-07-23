class TeamsController < ApplicationController

  def index
    teams = Team.all.includes(players: [:statistics, :videos])

    teams_data = teams.map do |team|
      {
        id: team.id,
        name: team.name,
        players: players_data_with_statistics(team.players)
      }
    end

    render json: teams_data, status: :ok
  end


  def show
    team = Team.find(params[:id])
    players = team.players.includes(:statistics, :videos)

    team_data = {
      id: team.id,
      name: team.name,
      players: players_data_with_statistics(players)
    }

    render json: team_data, status: :ok
  end


  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

    def destroy
    team = Team.find(params[:id])
    team.destroy
    head :no_content
  end

  private

def players_data_with_statistics(players)
    players.map do |player|
      {
        id: player.id,
        first_name: player.first_name,
        last_name: player.last_name,
        sport_id: player.sport_id,
        team_id: player.team_id,
        image_url: player.image.attached? ? url_for(player.image) : nil,
        statistics: player.statistics,
        videos: player.videos
      }
    end
  end
  def team_params
    params.require(:team).permit(:name)
  end
end
