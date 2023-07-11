class SportMediaVideosController < ApplicationController
  skip_before_action :authorize, only: [:index, :create, :show, :destroy]
  before_action :set_sport

  def index
    sport_media_videos = @sport.sport_media_videos
    render json: sport_media_videos
  end

  def show
    sport_media_video = @sport.sport_media_videos.find(params[:id])
    render json: sport_media_video
  end

  def create
    sport_media_video = @sport.sport_media_videos.build(sport_media_video_params)
    if sport_media_video.save
      render json: sport_media_video, status: :created
    else
      render json: sport_media_video.errors, status: :unprocessable_entity
    end
  end

  def update
    sport_media_video = @sport.sport_media_videos.find(params[:id])
    if sport_media_video.update(sport_media_video_params)
      render json: sport_media_video, status: :ok
    else
      render json: sport_media_video.errors, status: :unprocessable_entity
    end
  end

  def destroy
    sport_media_video = @sport.sport_media_videos.find(params[:id])
    sport_media_video.destroy
    head :no_content
  end

  private

  def set_sport
    @sport = Sport.find(params[:sport_id])
  end

  def sport_media_video_params
    params.require(:video).permit(:url, :title)
  end
end
