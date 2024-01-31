Rails.application.routes.draw do


  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "sessions#new"
  get "about", to: "pages#about"
  get "signup", to: "users#new"

  resources :articles
  resources :users, except: [:new]

  get "login", to:"sessions#new"
  post "login", to:"sessions#create"
  delete "logout", to:"sessions#destroy"

  # mount API::Base => '/'
end
