Rails.application.routes.draw do
  resources :countries
  resources :users, :except => [:show]
  get '/users/:username', :to => 'users#show'
  resources :sessions

  get '/member-data', to: 'members#show'
  namespace :api do
    namespace :v1 do
      resources :rolls
      get '/rolls/user/:id', :to => 'rolls#rolls_in_user', as: 'rolls_in_user'
      resources :entries
      get '/entries/roll/:id', :to => 'entries#entries_in_roll', as: 'entries_in_roll'
      get '/entries/country/:country', :to => 'entries#entries_in_country', as: 'entries_in_country'
      get '/entries/country/:country/user/:user_id', :to => 'entries#entries_in_country_user', as: 'entries_in_country_user'
      get '/entries/user/:username', :to => 'entries#entries_in_user', as: 'entries_in_user'
      resources :ratings
    end
  end
end