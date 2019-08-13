Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :tweets
  root 'tweets#index'
  
  resources :users, only: [:show, :edit, :update]
  
  get '/box/new' => 'opinions#new'
  post '/box/create' => 'opinions#create'
  
end
