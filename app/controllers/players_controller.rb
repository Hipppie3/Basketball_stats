class PlayersController < ApplicationController
  # skip_before_action :authorize, only: [:index, :show, :games, :players_for_game]

def index
  players = Player.includes(:games, :statistics, :videos, :sport) # Include the games association
  players_data = players.map do |player|
    sport_data = player.sport ? { id: player.sport.id, name: player.sport.name } : nil

    {
      id: player.id,
      first_name: player.first_name,
      last_name: player.last_name,
      sport: sport_data,
      team_id: player.team_id,
      image_url: player.image.attached? ? url_for(player.image) : nil,
      statistics: player.statistics,
      videos: player.videos,
      games: player.games.map do |game|
        {
          id: game.id,
          date: game.formatted_date,
          # Include other game attributes as needed
        }
      end
    }
  end

  render json: players_data, status: :ok
end



  def show
    player = Player.includes(:games, :statistics, :videos, :sport).find(params[:id])

    player_data = {
      id: player.id,
      first_name: player.first_name,
      last_name: player.last_name,
      sport: {
        id: player.sport.id,
        name: player.sport.name # Include other attributes of Sport as needed
      },
      team_id: player.team_id,
      image_url: player.image.attached? ? url_for(player.image) : nil,
      statistics: player.statistics,
      videos: player.videos,
      games: player.games.map do |game|
        {
          id: game.id,
          date: game.formatted_date,
          # Include other game attributes as needed
        }
      end
    }

    render json: player_data, status: :ok
  end


def create
  player = Player.new(player_params)

  if params[:player][:image].present?
    player.image.attach(params[:player][:image])
  end

  if player.save
    player_data = {
      id: player.id,
      first_name: player.first_name,
      last_name: player.last_name,
      sport: {
        id: player.sport.id,
        name: player.sport.name # Include other attributes of Sport as needed
      },
      team_id: player.team_id,
      image_url: player.image.attached? ? url_for(player.image) : nil,
      statistics: player.statistics,
      videos: player.videos
    }
    render json: player_data, status: :created
  else
    render json: player.errors, status: :unprocessable_entity
  end
end

 def games
    player = Player.find(params[:id])
    games = player.games

    render json: games, status: :ok
  end


def update
  player = Player.find(params[:id])

  if player.update(player_params)
    player_data = {
      id: player.id,
      first_name: player.first_name,
      last_name: player.last_name,
      sport: {
        id: player.sport.id,
        name: player.sport.name # Include other attributes of Sport as needed
      },
      team_id: player.team_id,
      image_url: player.image.attached? ? url_for(player.image) : nil,
      statistics: player.statistics,
      videos: player.videos
    }
    render json: player_data, status: :ok
  else
    render json: player.errors, status: :unprocessable_entity
  end
end

 def upload_image
  player = Player.find(params[:id])

  if params[:player][:image].present? # Updated line
    player.image.attach(params[:player][:image]) # Updated line
    render json: { message: "Image uploaded successfully!" }, status: :ok
  else
    render json: { error: "Image file missing or invalid." }, status: :unprocessable_entity
  end
end
# In your players_controller.rb

def players_for_game
  game = Game.find(params[:game_id])
  players = game.players.includes(:statistics, :games)

  players_data = players.map do |player|
    {
      id: player.id,
      first_name: player.first_name,
      last_name: player.last_name,
      sport: {
        id: player.sport.id,
        name: player.sport.name # Include other attributes of Sport as needed
      },
      team_id: player.team_id,
      image_url: player.image.attached? ? url_for(player.image) : nil,
      statistics: player.statistics.map do |statistic|
        statistic_game = statistic.game # New variable for the associated game with the statistic
        {
          id: statistic.id,
          w_l: statistic.w_l,
          ppg: statistic.ppg,
          rbg: statistic.rbg,
          apg: statistic.apg,
          spg: statistic.spg,
          bpg: statistic.bpg,
          fgm: statistic.fgm,
          fga: statistic.fga,
          fg_percentage: statistic.fg_percentage,
          two_pm: statistic.two_pm,
          two_pa: statistic.two_pa,
          three_pm: statistic.three_pm,
          three_pa: statistic.three_pa,
          oreb: statistic.oreb,
          dreb: statistic.dreb,
          reb: statistic.reb,
          ast: statistic.ast,
          stl: statistic.stl,
          blk: statistic.blk,
          to: statistic.to,
          pts: statistic.pts,
          game: {
            id: statistic_game.id, # Use the correct game ID
            date: statistic_game.formatted_date,
            # Include other game attributes as needed
          }
        }
      end,
      videos: player.videos,
      games: player.games.map do |player_game|
        {
          id: player_game.id,
          date: player_game.formatted_date,
          # Include other game attributes as needed
        }
      end
    }
  end

  render json: players_data, status: :ok
end



  def destroy
    player = Player.find_by!(id: params[:id])
    player.destroy
    head :no_content
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :image, :sport_id, :team_id, videos_attributes: [:id, :url, :title], statistics_attributes: [:id, :w_l, :ppg, :rbg, :apg, :spg, :bpg, :fgm, :fga, :fg_percentage, :two_pm, :two_pa, :three_pm, :three_pa, :oreb, :dreb, :reb, :ast, :stl, :blk, :to, :pts])
  end
end
