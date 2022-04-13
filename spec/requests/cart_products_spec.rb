require 'rails_helper'

RSpec.describe "CartProducts", type: :request do
subject do
    cart = Cart.create!
    product = Product.create!(product_code: 'SR1', name: 'Strawberries', price: 5.00)
    CartProduct.create(product: product, cart: cart, quantity: 2)
  end

  describe 'POST /add' do
    it 'returns http status 302 (redirect)' do
      subject
      post add_cart_product_path(subject.cart, subject.product)
      expect(response).to have_http_status(302)
    end

    it 'redirect_to products#index returns http success' do
      subject
      post add_cart_product_path(subject.cart, subject.product)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end

    it 'creates a cart_product, if not present' do
      cart = Cart.create!
      product = Product.create!(product_code: 'SR2', name: 'Strawberries', price: 5.00)
      post add_cart_product_path(cart, product)
      expect(response).to have_http_status(302)
      expect(CartProduct.find_by(cart: cart, product: product, quantity: 1)).to eq(CartProduct.last)
    end

    it 'increases cart_product quantity, if present' do
      subject
      cart = subject.cart
      id = subject.id
      post add_cart_product_path(subject.cart, subject.product)
      expect(cart.cart_products.find(id).quantity).to eq(3)
    end
  end

  describe 'POST /remove' do
    it 'returns http status 302 (redirect)' do
      subject
      post remove_cart_product_path(subject.cart, subject.product)
      expect(response).to have_http_status(302)
    end

    it 'redirect_to product#index returns http success' do
      subject
      post remove_cart_product_path(subject.cart, subject.product)
      follow_redirect!
      expect(response).to have_http_status(:success)
    end

    it 'destroys the cart_product, if quantity is 1' do
      subject.quantity = 1
      subject.save!
      id = subject.id
      post remove_cart_product_path(subject.cart, subject.product)
      expect(response).to have_http_status(302)
      expect(CartProduct.all).to eq(CartProduct.all.filter { |p| p != id })
    end

    it 'decreases cart_product quantity, if present' do
      subject
      cart = subject.cart
      id = subject.id
      post remove_cart_product_path(subject.cart, subject.product)
      expect(cart.cart_products.find(id).quantity).to eq(1)
    end
  end
end
