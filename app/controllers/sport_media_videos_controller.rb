class SportMediaVideosController < ApplicationController
  before_action :set_sport

  def index
    @videos = @sport.media_videos
    render json: @videos
  end

  def create
    @video = @sport.media_videos.build(video_params)
    if @video.save
      render json: @video, status: :created
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  def update
    @video = @sport.media_videos.find(params[:id])
    if @video.update(video_params)
      render json: @video, status: :ok
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @video = @sport.media_videos.find(params[:id])
    @video.destroy
    head :no_content
  end

  private

  def set_sport
    @sport = Sport.find(params[:sport_id])
  end

  def video_params
    params.require(:video).permit(:url, :title)
  end
end
