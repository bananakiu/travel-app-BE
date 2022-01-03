Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  namespace :api do
    namespace :v1 do
      resources :rolls
      resources :entries
      resources :ratings

      post 'authenticate', to: 'authentication#create'
    end
  end
end