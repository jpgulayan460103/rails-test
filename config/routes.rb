Rails.application.routes.draw do
  get 'items/index'
  get 'items/list', to: 'items#listItems'
  resource :items

  get 'users/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
