Rails.application.routes.draw do
  devise_for :users
  resource :listings , only: [:index]
  resource :items , only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'listings#index'
end
