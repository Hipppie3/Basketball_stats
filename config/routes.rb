Rails.application.routes.draw do
    resources :players do
    resources :statistics
    resources :videos
  end
   get 'cors-test', to: 'test#cors_test'

end
