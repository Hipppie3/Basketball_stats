Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    # Specify the domain that is allowed to access your API

    resource '/api/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false
  end
end
