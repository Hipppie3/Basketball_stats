class TeamsController < ApplicationController
  def index
    teams = Team.all
    render json: teams
  end

  def show
    team = Team.find(params[:id])
    render json: team.to_json(include: :players)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

    def destroy
    team = Team.find(params[:id])
    team.destroy
    head :no_content
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
