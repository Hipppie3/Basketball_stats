class StatisticsController < ApplicationController
# skip_before_action :authorize, only: [:index, :show]

  def index
    if params[:player_id].present?
      player = Player.find(params[:player_id])
      statistics = player.statistics.includes(:game) # Eager load the associated games
    else
      statistics = Statistic.all
    end

    render json: statistics.as_json(include: { game: {}, player: { include: :team } }), status: :ok
  end

  def show
    if params[:game_id].present?
      # If the 'game_id' parameter is provided, find the statistic within that game
      game = Game.find(params[:game_id])
      statistic = game.statistics.find(params[:id]) # Find the statistic within that game
    else
      # If the 'game_id' parameter is not provided, find the statistic directly by ID
      statistic = Statistic.find(params[:id]) # Find the statistic by ID, regardless of any game association
    end

    render json: statistic
  end

  def update
    statistic = Statistic.find(params[:id])
    game = Game.find(params[:game_id]) # Find the game by game_id

    if statistic.update(statistic_params.merge(game: game))
      render json: statistic, status: :ok
    else
      render json: statistic.errors, status: :unprocessable_entity
    end
  end

  def create
    player = Player.find(params[:player_id])
    statistic = player.statistics.create(statistic_params)

    if statistic.save
      render json: statistic, status: :created
    else
      render json: statistic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    statistic = Statistic.find(params[:id])
    statistic.destroy
    head :no_content
  end

  private

  def statistic_params
    params.require(:statistic).permit(game_id, :w_l, :ppg, :rbg, :apg, :spg, :bpg, :fgm, :fga, :fg_percentage, :two_pm, :two_pa, :three_pm, :three_pa, :oreb, :dreb, :reb, :ast, :stl, :blk, :to, :pts)
  end
end
