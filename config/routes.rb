Rails.application.routes.draw do
  get 'flight_ride/new'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  get 'flights/index'
  get '/signin' => "sessions#create"
  get '/login'  => "sessions#new"
  post '/sessions' => "sessions#create"
  post 'flights/new' => "flights#create"
  delete '/logout' => "sessions#destroy"

  patch '/login', to: 'sessions#create'


  get '/users' => "users#new"
  get '/auth/facebook/callback' => 'sessions#create'
 
   resources :users, :only => [:new, :create, :show]
   resources :flights, only: [:index, :show, :new, :create, :edit, :update]  # access to all the functions.
   
  #  post '/flight_ride/new' => "flight_ride#new" 

   # this is the code you need
    resources :users do
      resources :flight_rides, only: [:index, :show, :new, :create, :edit, :update, :destroy] # reduce the actions to what you only need
     end
  
    # resources :flight_rides, only:[:index]
# make Commercial . Not restful Flight +
   
    get 'commercial' => 'flights#commercial'
 end
