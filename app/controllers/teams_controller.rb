class TeamsController < ApplicationController
  # ...

  def index
    teams = Team.all.includes(:sport, players: [:statistics, :videos])

    teams_data = teams.map do |team|
      {
        id: team.id,
        name: team.name,
        sport: {
          id: team.sport.id,
          name: team.sport.name
        },
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
      sport: {
        id: team.sport.id,
        name: team.sport.name
      },
      players: players_data_with_statistics(players)
    }

    render json: team_data, status: :ok
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      render json: @team, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def update
    team = Team.find(params[:id])

    if team.update(team_params)
      render json: team, status: :ok
    else
      render json: team.errors, status: :unprocessable_entity
    end
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    head :no_content
  end

  private

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
      statistics: player.statistics || {}, # Use an empty hash if statistics are nil
      videos: player.videos || [] # Use an empty array if videos are nil
    }
  end
end


  def team_params
    params.require(:team).permit(:name, :sport_id)
  end
end
