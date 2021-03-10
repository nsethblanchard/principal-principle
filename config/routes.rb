Rails.application.routes.draw do
  
  root 'sessions#home'
  get '/signup' => "users#new"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  resources :assignments
  resources :teachers
  resources :students
  resources :users
 
end
