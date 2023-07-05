Rails.application.routes.draw do
    resources :players do
    resources :statistics
    resources :videos
  end
  match '*all', controller: 'application', action: 'cors_preflight_check', via: :options

end
