Rails.application.routes.draw do
  get 'item/index'

  get 'items/list', to: 'items#itemsList'
  # resource :items
  
  # get '/items/[:id]', to: 'items#show'
  get '/items/', to: 'items#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
