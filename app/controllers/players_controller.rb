class PlayersController < ApplicationController
      before_action :set_cors_headers, only: [:options]

    def index
        player = Player.all
        render json: player,  status: :ok
    end

    def show
        player = Player.find(params[:id])
        statistics = player.statistics
        videos = player.videos
        render json: { player: player, statistics: statistics, videos: videos }, status: :ok
    end


    def create
  player = Player.create!(player_params)
  render json: player, status: :created
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
  params.require(:player).permit(:first_name, :last_name, videos_attributes: [:id, :url, :title], statistics_attributes: [:id, :game_date, :matchup, :w_l, :ppg, :rbg, :apg, :spg, :bpg, :fgm, :fga, :fg_percentage, :two_pm, :two_pa, :three_pm, :three_pa, :oreb, :dreb, :reb, :ast, :stl, :blk, :to, :pts])
end
def set_cors_headers
    headers['Access-Control-Allow-Origin'] = 'https://wondrous-speculoos-749189.netlify.app'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'
  end
  end


