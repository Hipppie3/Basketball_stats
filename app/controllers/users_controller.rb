class UsersController < ApplicationController
  skip_before_action :authorize, only: [:index, :create]
  
def index
  users = User.all
  render json: users
end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def show
      user = User.find(session[:user_id])
      render json: user
   end
  
   def me
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password, :password_confirmation, :email)
  end
end
  