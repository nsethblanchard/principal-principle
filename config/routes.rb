Rails.application.routes.draw do
  
  root 'sessions#home'
  get '/signup' => "users#new"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"

  resources :users
  resources :teachers do
    resources :assignments, only [:new, :create, :index]
  end
  resources :students do
    resources :assignments, only [:index]
  end
  
  resources :assignments
end
