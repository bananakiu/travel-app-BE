Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
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