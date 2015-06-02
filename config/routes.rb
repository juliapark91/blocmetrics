Rails.application.routes.draw do

  resources :registered_applications

  devise_for :users
  resources :users, only: [:show]

  get "welcome/index"
  
  root to: 'welcome#index'
end
