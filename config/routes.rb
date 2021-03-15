Rails.application.routes.draw do
  
  
  
  root 'sessions#home'
  get '/signup' => "users#new"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"
  
  
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :users
  resources :teachers do
    resources :assignments, only: [:new, :create, :index]
    #when restricting the routes, it is called "shallow routing"-meaning only nesting which ones you need
  end
  resources :students do
    resources :assignments, only: [:index]
  end
  
  resources :assignments
end
