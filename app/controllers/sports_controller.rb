class SportsController < ApplicationController
def index
  sports = Sport.includes(:sport_media_videos)
  render json: sports, include: :sport_media_videos
end

  def show
    sport = Sport.find(params[:id])
    sport_media_videos = sport.sport_media_videos
    render json: { sport: sport, sport_media_videos: sport_media_videos }, status: :ok

  end

  def create
    sport = Sport.new(sport_params)
    if sport.save
      render json: sport, status: :created
    else
      render json: sport.errors, status: :unprocessable_entity
    end
  end

  def update
    sport = Sport.find(params[:id])
    if sport.update(sport_params)
      render json: sport, status: :ok
    else
      render json: sport.errors, status: :unprocessable_entity
    end
  end

  def destroy
    sport = Sport.find(params[:id])
    sport.destroy
    head :no_content
  end



  private

  def sport_params
    params.require(:sport).permit(:name)
  end
end
