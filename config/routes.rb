Rails.application.routes.draw do
  get 'mypages/index'
  devise_for :users
  get 'items/index'
  resources :users, only: [:edit]
  resources :card, only: [:new, :show]

  # resources :mypages, only: [:index, :show] 
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'mypages#index'

end
