Rails.application.routes.draw do
    resources :players do
    resources :statistics
    resources :videos
  end
end
