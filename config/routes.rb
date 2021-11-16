Rails.application.routes.draw do
  get '/user_profile', to: 'pages#my_profile'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plushes, only: [:new, :create, :index, :show]
  resources :rentals, only: [:new, :create]
end
