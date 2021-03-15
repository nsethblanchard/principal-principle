Rails.application.routes.draw do
    
  root 'sessions#home'
  
  get '/signup' => "users#new"
  

  #login routes
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  #logout route
  delete '/logout' => "sessions#destroy"
  
  #omniauth callback route
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  #if you want more than one third party verification, you need to have a dynamic :provider...
  # get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :users
  
  resources :teachers do
    resources :assignments, shallow: true
    # "shallow true" replaces only: [:new, :create, :index] as they are the most common trio
  end
  
  resources :students do
    resources :assignments, only: [:index]
  end
  
  resources :assignments
  get '/alpha' => 'assignments#alpha'
  get '/overdue_assignments' => 'assignments#overdue_assignments'
end
