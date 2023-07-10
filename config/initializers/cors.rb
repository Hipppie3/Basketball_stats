Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do

    origins 'https://wondrous-speculoos-749189.netlify.app'
    # Specify the domain that is allowed to access your API

    resource '/players/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
    resource '/sessions/*',
      headers: :any,
      methods: [:get, :post, :delete, :options, :head], # Add any other methods needed for the '/sessions' path
      credentials: true
      resource '/sports/*',
      headers: :any,
      methods: [:get, :post, :delete, :options, :head], # Add any other methods needed for the '/sessions' path
      credentials: true
  end
end
