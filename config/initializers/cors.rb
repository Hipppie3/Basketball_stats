Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://wondrous-speculoos-749189.netlify.app'
    # Specify the domain that is allowed to access your API

    resource '/api/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
