Rails.application.routes.draw do
  
  root 'users#index'
  #sets root to this page so localhost:3000/ brings you to the users index page which will be the login page
  resources :users
  resources :listings

  
end
