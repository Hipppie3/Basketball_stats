class StatisticsController < ApplicationController

  def index
    player = Player.find(params[:player_id])
    statistics_with_game_date = player.statistics.map do |statistic|
      {
        id: statistic.id,
        game_date: statistic.game.date, # Access the game date through the statistic's associated game
        w_l: statistic.w_l,
        ppg: statistic.ppg,
        # ... other statistic attributes ...
      }
    end

    render json: statistics_with_game_date
  end

  def show
    player = Player.find_by!(params[:player_id])
    statistic = player.statistics.find(params[:id])
      render json: {
      id: statistic.id,
      game_date: statistic.game.date, # Access the game date through the statistic's associated game
      w_l: statistic.w_l,
      ppg: statistic.ppg,
      # ... other statistic attributes ...
    }
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
