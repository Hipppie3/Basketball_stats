Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
      get '/me', to: 'users#me'

  resources :users, only: [:index, :create, :update, :show] do
    collection do
      get :index
    end
  end

  resources :players do
    resources :statistics
    resources :videos
    post 'upload_image', on: :member
  end

  resources :sports do
    resources :sport_media_videos
  end

  get 'cors-test', to: 'test#cors_test'
end
