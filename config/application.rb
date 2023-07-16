require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BasketballStats
  class Application < Rails::Application
  config.load_defaults 7.0

  # Enable CORS

    # Must add these lines!
    # Adding back cookies and session middleware
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, expire_after: 7.days

    # Use SameSite=Strict for all cookies to help protect against CSRF
    config.action_dispatch.cookies_same_site_protection = :strict

  end
end
