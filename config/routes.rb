Rails.application.routes.draw do
  
  root 'application#home'
  #sets root to this page so localhost:3000/ brings you to the users index page which will be the login page
  resources :users
  resources :listings

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
