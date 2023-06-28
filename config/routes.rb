Rails.application.routes.draw do
    resources :players, only: [:index, :show] do
    resources :stats, only: [:index, :show]
    resources :informations, only: [:index, :show]
  end
end
