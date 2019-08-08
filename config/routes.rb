Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :tweets
  root 'tweets#index'
  
  resources :users, only: [:show, :edit, :update]
end
