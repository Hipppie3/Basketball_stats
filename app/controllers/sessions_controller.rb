class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:create]

 def create
  user = User.find_by(username: params[:username])
  if user&.authenticate(params[:password])
    session[:user_id] = user.id
    render json: user, status: :created
  else
    render json: { error: 'Incorrect username or password, please try again' }, status: :unauthorized
  end
end


def destroy
  Rails.logger.debug "Destroying session with user_id: #{session[:user_id]}"
  session.delete(:user_id)
  head :no_content
end


end
