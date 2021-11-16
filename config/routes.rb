Rails.application.routes.draw do
  get 'rentals/create'
  devise_for :users
  root to: 'plushes#index'
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plushes, only: [:new, :create, :index, :show]
  resources :rentals, only: [:new, :create]
end
