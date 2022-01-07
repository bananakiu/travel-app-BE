Rails.application.routes.draw do
  resources :users
  resources :sessions

  get '/member-data', to: 'members#show'
  namespace :api do
    namespace :v1 do
      resources :rolls
      resources :entries
      resources :ratings
    end
  end
end