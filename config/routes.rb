Rails.application.routes.draw do
  get 'mypages/index'
  devise_for :users
  get 'items/index'
  resources :users, only: [:edit, :update]
  resources :card, only: [:new, :show]

  root 'mypages#index'

end
