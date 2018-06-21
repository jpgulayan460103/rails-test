Rails.application.routes.draw do

  get 'items/list', to: 'items#itemsList'
  root 'items#index'
  resource :items
  put 'items/(:id)', to: 'items#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
