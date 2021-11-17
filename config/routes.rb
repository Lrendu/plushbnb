Rails.application.routes.draw do
  get 'users/user_profile', to: 'users#user_profile'
  get 'users/user_plushes', to: 'users#user_plushes'
  devise_for :users
  root to: 'plushes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plushes, only: [:new, :create, :index, :show, :destroy]
  resources :rentals, only: [:new, :create]
end
