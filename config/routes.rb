Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rolls
      resources :entries
      resources :ratings

      post 'authenticate', to: 'authentication#create'
    end
  end
end