Rails.application.routes.draw do
  
  get '/signup' => "users#new"


  resources :assignments
  resources :teachers
  resources :students
  resources :users
 
end
