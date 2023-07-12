require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BasketballStats
  class Application < Rails::Application
  config.load_defaults 7.0

  # Enable CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://wondrous-speculoos-749189.netlify.app' # Update with the appropriate origin or '*' to allow all origins
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

    # Must add these lines!
    # Adding back cookies and session middleware
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    # Use SameSite=Strict for all cookies to help protect against CSRF
    config.action_dispatch.cookies_same_site_protection = :strict

  end
end
