Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'users/sign_up', to: 'users/registrations#new'
    get  'users/addresses', to: 'users/registrations#new_address'
    post 'users/addresses', to: 'users/registrations#create_address'
  end
  resources :mypages, only: [:index]
  resources :items, only: [:index, :show]
  resources :users, only: [:edit, :update]
  resources :card, only: [:new, :show]
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'front#index'
end