Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://wondrous-speculoos-749189.netlify.app', 'localhost:5173', 'https://hipppie.com'
    # Specify the domain(s) that are allowed to access your API

    resource '/players/*',
      headers: :any,
      methods: [:get, :post, :players_for_game, :show, :put, :patch, :delete, :options, :head, :update],
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
      methods: [:get, :post, :delete, :show, :options, :head],
      credentials: true

    resource '/teams/*',
      headers: :any,
      methods: [:get, :post, :delete, :show, :update, :put, :patch, :options, :head],
      credentials: true

    resource '/games/*',
      headers: :any,
      methods: [:get, :post, :delete, :show, :update, :put, :patch, :options, :head],
      credentials: true
      
    resource '/users/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head, :update],
      credentials: true

      resource '/statistics/*',
      headers: :any,
      methods: [:get, :post, :show, :update, :put, :patch, :delete, :options, :head],
      credentials: true

  end
end
