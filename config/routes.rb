Rails.application.routes.draw do
  match '*path', to: 'cors#handle_options', via: :options

  resources :players do
    resources :statistics
    resources :videos
  end
end
