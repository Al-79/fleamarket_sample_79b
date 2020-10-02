Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  # resources :mypages, only: [:index, :show] 
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'mypages#index'

end
