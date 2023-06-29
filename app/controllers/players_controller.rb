class PlayersController < ApplicationController
  def index
    players = Player.all
    render json: players, include: [:stats, :informations]
  end

  def show
    player = Player.find(params[:id])

    render json: {
      player: player,
      image_url: Cloudinary::Utils.cloudinary_url(player.cloudinary_image_public_id)
    }, include: [:stats, :informations]
  end
end
