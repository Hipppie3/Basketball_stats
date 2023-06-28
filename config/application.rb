require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BasketballStats
  class Application < Rails::Application
  config.load_defaults 7.0

  # Enable CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Update with the appropriate origin or '*' to allow all origins
        resource '*', headers: :any, methods: [:get, :post, :options] # Adjust the allowed methods as per your requirements
      end
  end
end
