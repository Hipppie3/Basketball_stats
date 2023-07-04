class CorsController < ApplicationController
  def handle_options
    head :ok
  end
end
