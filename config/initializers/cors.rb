Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://wondrous-speculoos-749189.netlify.app', 'localhost:5173'
    # Specify the domain(s) that are allowed to access your API

    resource '/players/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true

    resource '/login',
      headers: :any,
      methods: [:post, :options],
      credentials: true

    resource '/logout',
      headers: :any,
      methods: [:delete, :options],
      credentials: true

    resource '/me', # Add this line
      headers: :any,
      methods: [:get, :me, :options],
      credentials: true

    resource '/sports/*',
      headers: :any,
      methods: [:get, :post, :delete, :options, :head],
      credentials: true

    resource '/users/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true


  end
end
