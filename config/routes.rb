Rails.application.routes.draw do
  resources :mypages, only: [:index]
  devise_for :users
  resources :items, only: [:index]
  resources :users, only: [:edit, :update]
  resources :card, only: [:new, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'front#index'
end
