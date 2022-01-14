Rails.application.routes.draw do
  resources :users
  resources :sessions

  get '/member-data', to: 'members#show'
  namespace :api do
    namespace :v1 do
      resources :rolls
      get '/rolls/user/:id', :to => 'rolls#rolls_in_user', as: 'rolls_in_user'
      resources :entries
      get '/entries/roll/:id', :to => 'entries#entries_in_roll', as: 'entries_in_roll'

      get '/entries/roll/:id/food', :to => 'entries#entries_in_roll_food', as: 'entries_in_roll_food'
      get '/entries/roll/:id/attraction', :to => 'entries#entries_in_roll_attraction', as: 'entries_in_roll_attraction'
      get '/entries/roll/:id/person', :to => 'entries#entries_in_roll_person', as: 'entries_in_roll_person'
      get '/entries/roll/:id/fashion', :to => 'entries#entries_in_roll_fashion', as: 'entries_in_roll_fashion'
      get '/entries/roll/:id/accommodation', :to => 'entries#entries_in_roll_accommodation', as: 'entries_in_roll_accommodation'
      get '/entries/roll/:id/transporation', :to => 'entries#entries_in_roll_transportation', as: 'entries_in_roll_transportation'
      get '/entries/roll/:id/other', :to => 'entries#entries_in_roll_other', as: 'entries_in_roll_other'

      get '/entries/country/:country', :to => 'entries#entries_in_country', as: 'entries_in_country'
      resources :ratings
    end
  end
end