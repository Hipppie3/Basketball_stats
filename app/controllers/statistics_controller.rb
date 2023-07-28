class StatisticsController < ApplicationController

  def index
    player = Player.find(params[:player_id])
    statistics = player.statistics.includes(:game) # Eager load the associated games
    render json: statistics.to_json(include: :game) # Include the game data in the JSON response
  end

  def show
    game = Game.find(params[:game_id]) # Find the game by game_id
    statistic = game.statistics.find(params[:id]) # Find the statistic within that game
    render json: statistic
  end
  
  def update
    player = Player.find(params[:player_id])
    statistic = player.statistics.find(params[:id])

    if statistic.update(statistic_params)
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
    params.require(:statistic).permit(:game_date, :w_l, :ppg, :rbg, :apg, :spg, :bpg, :fgm, :fga, :fg_percentage, :two_pm, :two_pa, :three_pm, :three_pa, :oreb, :dreb, :reb, :ast, :stl, :blk, :to, :pts)
  end
end
