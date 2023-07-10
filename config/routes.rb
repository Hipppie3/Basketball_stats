Rails.application.routes.draw do
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
