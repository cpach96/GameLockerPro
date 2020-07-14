Rails.application.routes.draw do
  
  root 'application#home'
  #sets root to this page so localhost:3000/ brings you to the users index page like homepage
  resources :users
  resources :listings
  resources :comments, only:[:new, :create, :edit, :update, :delete]

  resources :users, only: [:show, :index] do
    resources :listings, only: [:show, :index, :new]
  end
  #fix nested resources

 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get "/auth/:provider/callback" => "sessions#create"
end
