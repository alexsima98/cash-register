class CartProductsController < ApplicationController
  before_action :set_cart_and_product

  def add
    cart_product = @cart.cart_products.find_by(product: @product)

    if cart_product
      cart_product.quantity += 1
      cart_product.save!
    else
      CartProduct.create(product: @product, cart: @cart)
    end

    redirect_to root_path
  end

  def remove
    cart_product = @cart.cart_products.find_by(product: @product)
    cart_product.quantity -= 1

    if cart_product.quantity.zero?
      cart_product.destroy!
    else
      cart_product.save
    end

    redirect_to root_path
  end

  private

  def set_cart_and_product
    @cart = Cart.find(params[:cart_id])
    @product = Product.find(params[:product_id])
  end
end
