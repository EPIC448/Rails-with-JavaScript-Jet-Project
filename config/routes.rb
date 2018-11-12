Rails.application.routes.draw do
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
   root'users#new'
   resources :users, :only => [:new, :create, :show]

  # root 'flights#index' # i will add it if i need it. 

 end
