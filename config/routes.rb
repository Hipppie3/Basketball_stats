Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/me', to: 'users#me'
  
  resources :players do
    resources :statistics
    resources :videos
    post 'upload_image', on: :member
  end

  get 'cors-test', to: 'test#cors_test'
end
