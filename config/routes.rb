Rails.application.routes.draw do
  resources :users
  resources :sessions

  get '/member-data', to: 'members#show'
  namespace :api do
    namespace :v1 do
      resources :rolls
      get '/rolls/user/:id', :to => 'rolls#rolls_in_user', as: 'rolls_in_user'
      resources :entries
      get '/entries/roll/:roll_id/entry/:id', :to => 'entries#show', as: 'show'
      get '/entries/roll/:id', :to => 'entries#entries_in_roll', as: 'entries_in_roll'
      get '/entries/country/:country', :to => 'entries#entries_in_country', as: 'entries_in_country'
      resources :ratings
    end
  end
end