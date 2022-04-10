Rails.application.routes.draw do
  get 'cart_products/add' , to: 'products#index'
  get 'cart_products/remove', to: 'products#index'
  get 'products/index'
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
