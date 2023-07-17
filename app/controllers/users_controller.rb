class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create]


  def create
      user = User.create!(user_params)
      session[:user_id] = user.id
      render json: user, status: :created
   end


  def show
      user = User.find(session[:user_id])
      render json: user
  end

    
def index
  users = User.all
  render json: users
end

  # Other controller actions...

  private

  def user_params
    params..permit(:id, :username, :name, :password, :password_confirmation, :email)
  end
end
