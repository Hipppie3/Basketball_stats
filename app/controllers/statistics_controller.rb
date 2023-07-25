class StatisticsController < ApplicationController

  def index
    statistics = player.statistics
    render json: statistics
  end

  def show
    player = Player.find_by!(params[:player_id])
    statistic = player.statistics.find(params[:id])
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
  params.require(:statistic).permit(:game_date, :w_l, :fgm, :fga, :fg_percentage, :two_pm, :two_pa, :three_pm, :three_pa, :oreb, :dreb, :reb, :ast, :stl, :blk, :to, :pts)
end

end
