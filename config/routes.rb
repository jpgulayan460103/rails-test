Rails.application.routes.draw do

  get 'items/list', to: 'items#itemsList'
  get 'login', to: 'authentication#login'
  get 'logout', to: 'authentication#logout'
  post 'login', to: 'authentication#authenticate'
  root 'items#index'
  resources :items
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
