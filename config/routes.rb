Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root 'tweets#index'
  
  resources :tweets do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create, :destroy]
    resources :views, only: [:create]
  end
  
  resources :users, only: [:show, :edit, :update]
  
  get '/box/new' => 'opinions#new'
  post '/box/create' => 'opinions#create'
  
end
