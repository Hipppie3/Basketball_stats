module BasketballStats
  class Application < Rails::Application
    config.load_defaults 7.0

    # Enable CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Update with the appropriate origin or '*' to allow all origins
        resource '*', 
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true # Enable credentials for cross-origin requests
      end
    end

    # Must add these lines!
    # Adding back cookies and session middleware
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    # Use SameSite=Strict for all cookies to help protect against CSRF
    config.action_dispatch.cookies_same_site_protection = :strict
  end
end
