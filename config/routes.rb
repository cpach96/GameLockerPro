Rails.application.routes.draw do
  
  root 'application#home'
  #sets root to this page so localhost:3000/ brings you to the users index page like homepage
  resources :users
  resources :listings
  resources :comments, only:[:new, :create, :edit, :update, :delete]

  resources :users, only: [:show, :index] do
    resources :listings, only: [:show, :index, :new]
  end

 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  #get '/logout' => 'sessions#destroy' #fix this shouldnt be a get /logout
  post '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'
end
