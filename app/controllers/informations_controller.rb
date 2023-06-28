class InformationsController < ApplicationController
  def index
    informations = Information.all
    render json: informations
  end

  def show
    player = Player.find(params[:player_id])
    informations = player.informations
    render json: informations
  end
end
