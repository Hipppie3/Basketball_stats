class UsersController < ApplicationController
  skip_before_action :authorize, only: [:index, :create]
  
def index
  users = User.all
  render json: users
end

  def create
      user = User.create!(user_params)
      session[:user_id] = user.id
      render json: user, status: :created
   end


  def me
    user = User.find_by(session[:user_id])
    if user
      render json: user
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # Other controller actions...

  private

  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation, :email)
  end
end
