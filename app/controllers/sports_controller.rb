class SportsController < ApplicationController
  def index
    @sports = Sport.all
    render json: @sports
  end

  def show
    @sport = Sport.find(params[:id])
    render json: @sport
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      render json: @sport, status: :created
    else
      render json: @sport.errors, status: :unprocessable_entity
    end
  end

  def update
    @sport = Sport.find(params[:id])
    if @sport.update(sport_params)
      render json: @sport, status: :ok
    else
      render json: @sport.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy
    head :no_content
  end

  private

  def sport_params
    params.require(:sport).permit(:name)
  end
end
