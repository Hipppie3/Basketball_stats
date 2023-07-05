Rails.application.routes.draw do
    resources :players do
    resources :statistics
    resources :videos
    collection do
      match 'options', via: :options
    end
  end


end
