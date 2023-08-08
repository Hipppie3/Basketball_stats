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
    game_data = @game.as_json(include: {
      statistics: {
        include: {
          player: {
            include: [:team, :image_attachment] # Include the image_attachment
          }
        }
      }
    })

    players_data_with_images = game_data['statistics'].map do |statistic|
      player_data = statistic['player']
      if player_data['image_attachment'].present?
        player_data['image_url'] = url_for(player_data['image_attachment'])
      else
        player_data['image_url'] = nil
      end
      player_data.delete('image_attachment') # Remove the image_attachment key
      player_data
    end

    game_data['statistics'] = players_data_with_images
    render json: game_data, status: :ok
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
      render json: { error: 'Game not found' }, status: :not_foundg
    else
      @game.destroy
      head :no_content
    end
  end

  private

def game_params
  params.require(:game).permit(:name, :date)
end

end
