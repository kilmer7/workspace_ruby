Rails.application.routes.draw do
  resources :movement_accounts
  resources :agencies
  devise_for :users
  resources :accounts
  root to: "home#index"
  get "home/username"
  get "movement_accounts/index"
  get "accounts/index"
end
