Rails.application.routes.draw do
  
  get '/signup' => "users#new"
  get '/login' => "sessions#new"

  resources :assignments
  resources :teachers
  resources :students
  resources :users
 
end
