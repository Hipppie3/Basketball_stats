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

    # Include flash middleware
    config.middleware.use ActionDispatch::Flash
  end
end
