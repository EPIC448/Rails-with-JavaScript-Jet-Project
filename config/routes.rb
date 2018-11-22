Rails.application.routes.draw do
  get 'flight_ride/new'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  get 'flights/index'
  get '/signin' => "sessions#login"
  post '/sessions' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  get '/users' => "users#new"
  get '/auth/facebook/callback' => 'sessions#create'
 
   resources :users, :only => [:new, :create, :show]
   resources :flights, only: [:index, :show, :new, :create, :edit, :update]  # access to all the functions.
   
  #  post '/flight_ride/new' => "flight_ride#new" 

   # this is the code you need
    resources :users do
      resources :flight_rides, only: [:index, :show, :new, :create, :edit, :update] # reduce the actions to what you only need
     end
  
   
 end
