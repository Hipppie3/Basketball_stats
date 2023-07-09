Rails.application.routes.draw do
  resources :players do
    resources :statistics
    resources :videos
    post 'upload_image', to: 'players#upload_image' # Add this line
  end

  get 'cors-test', to: 'test#cors_test'
end
