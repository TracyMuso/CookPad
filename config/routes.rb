Rails.application.routes.draw do
  resources :foods
  devise_for :users
  root "users#index"

  resources :users
  # inventories
  resources :inventory_foods
  resources :inventories
end
