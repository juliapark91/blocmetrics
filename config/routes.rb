Rails.application.routes.draw do

  get 'events/index'

  get 'events/show'

  resources :registered_applications

  devise_for :users
  resources :users, only: [:show]

  get "welcome/index"
  
  root to: 'welcome#index'
end
