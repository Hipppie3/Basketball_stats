class PlayersController < ApplicationController
   def index
    players = Player.all
    render json: players, include: [:stats, :informations]
  end

  def show
    player = Player.find(params[:id])
    render json: player, include: [:stats, :informations]
  end

end
