Rails.application.routes.draw do
  resources :orders
  resources :notifications
  		root to: 'notifications#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
