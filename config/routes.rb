Rails.application.routes.draw do
  root to: "listings#index"

  resources :sessions, only: [:new, :create, :destroy]
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :trips
  resources :locations
  resources :reviews
  resources :reservations 
  resources :listings ,only: [:delete,:new,:create,:show,:index,:edit,:update]
  resources :listings do 
    resources :reservations, only: [:new,:create,:show,:index]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
