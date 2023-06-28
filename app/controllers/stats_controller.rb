class StatsController < ApplicationController
  def index
    stats = Stat.all
    render json: stats
  end

  def show
    player = Player.find(params[:player_id])
    stats = player.stats
    render json: stats
  end
end
