class GamesController < ApplicationController
  def index
    games = Game.all
    render json: games, status: :ok
  end

  def show
    @game = Game.find_by(id: params[:id])
    if @game.nil?
      render json: { error: 'Game not found' }, status: :not_found
    else
      render json: @game, status: :ok
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :date)
  end
end
