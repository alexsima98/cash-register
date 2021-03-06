class ProductsController < ApplicationController
  def index
    @products = Product.all
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end
  end
end
