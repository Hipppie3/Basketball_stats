class UsersController < ApplicationController
  before_action :require_login, only: [:me]

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: 'User registration successful!'
    else
      render :new
    end
  end

  def me
    if current_user
      render json: current_user, status: :ok
    else
      render json: { error: 'Not authenticated' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    unless current_user
      render json: { error: 'Not authenticated' }, status: :unauthorized
    end
  end
end
