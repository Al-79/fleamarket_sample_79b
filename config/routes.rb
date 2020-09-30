Rails.application.routes.draw do
  get 'front/index'
  devise_for :users
  get 'items/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # after
  root 'front#index'
end
