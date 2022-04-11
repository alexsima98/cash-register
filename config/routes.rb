Rails.application.routes.draw do
  root to: 'products#index'
  post 'cart/:cart_id/add/:product_id', to: 'cart_products#add', as: :add_cart_product
  post 'cart/:cart_id/remove/:product_id', to: 'cart_products#remove', as: :remove_cart_product
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
