Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'users/sign_up', to: 'users/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get  'users/addresses', to: 'users/registrations#new_address'
    post 'users/addresses', to: 'users/registrations#create_address'
  end
  resources :listings , only: [:index]
  resources :mypages, only: [:index, :show]
  resources :items, only: [:index, :show, :new, :create] do
    member do
      get 'buy'
    end
  end
  resources :users, only: [:edit, :update, :create]
  resources :card, only: [:new, :show] do
    member do
    get 'registration'
    end
  end
  resources :addresses, only: [:create, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'front#index'
end
