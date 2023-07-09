class PlayersController < ApplicationController
    
    def index
        player = Player.all
        render json: player,  status: :ok
    end

def show
  player = Player.find(params[:id])
  statistics = player.statistics
  videos = player.videos
  image_url = url_for(player.image) if player.image.attached?

  render json: { player: player, statistics: statistics, videos: videos, image_url: image_url }, status: :ok
end




   def create
  player = Player.new(player_params)
  if params[:player][:image].present?
    player.image.attach(params[:player][:image])
  end

  if player.save
    render json: player, status: :created
  else
    render json: player.errors, status: :unprocessable_entity
  end
end



    def update
    player = Player.find(params[:id])

    if player.update(player_params)
      render json: player, status: :ok
    else
      render json: player.errors, status: :unprocessable_entity
    end
  end


    def destroy 
        player = Player.find_by!(id: params[:id])
        player.destroy
        head :no_content
    end

    private

 def player_params
  params.require(:player).permit(:first_name, :last_name, :image, videos_attributes: [:id, :url, :title], statistics_attributes: [:id, :game_date, :matchup, :w_l, :ppg, :rbg, :apg, :spg, :bpg, :fgm, :fga, :fg_percentage, :two_pm, :two_pa, :three_pm, :three_pa, :oreb, :dreb, :reb, :ast, :stl, :blk, :to, :pts])
end

  end


