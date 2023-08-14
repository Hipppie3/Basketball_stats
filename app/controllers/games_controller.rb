class GamesController < ApplicationController
  # skip_before_action :authorize, only: [:index, :show]

  def index
    games = Game.all
    render json: games, status: :ok
  end

  def show
    @game = Game.find_by(id: params[:id])
    if @game.nil?
      render json: { error: 'Game not found' }, status: :not_found
    else
      render json: @game.as_json(include: { statistics: { include: { player: { include: :team } } } })
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

def update
  @game = Game.find_by(id: params[:id])

  if @game.nil?
    render json: { error: 'Game not found' }, status: :not_found
  else
    if @game.update(game_params)
      render json: @game, status: :ok
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end
end


  def destroy
    @game = Game.find_by(id: params[:id])
    if @game.nil?
      render json: { error: 'Game not found' }, status: :not_found
    else
      # Delete associated statistics records first
      @game.statistics.destroy_all
      
      # Now you can safely delete the game
      @game.destroy
      head :no_content
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :date, :video_url, :home_team_score, :away_team_score)
  end
end
