class VideosController < ApplicationController
  before_action :set_player


  def create
    @video = @player.videos.build(video_params)
    if @video.save
      render json: @video, status: :created
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  def update
    @video = @player.videos.find(params[:id])
    if @video.update(video_params)
      render json: @video, status: :ok
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @video = @player.videos.find(params[:id])
    @video.destroy
    head :no_content
  end

  private

  def set_player
    @player = Player.find(params[:player_id])
  end

  def video_params
    params.require(:video).permit(:url, :title)
  end
end
