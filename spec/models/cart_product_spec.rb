require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  subject do
    product = Product.create!(product_code: 'SR1', name: 'Strawberry', price: 5.00)
    cart = Cart.create!
    described_class.create!(cart: cart, product: product, quantity: 1)
  end

  describe 'Association' do
    it { should belong_to :cart }
    it { should belong_to :product }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a product' do
      subject.product = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without cart' do
      subject.cart = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with a neutral quantity' do
      subject.quantity = 0
      expect(subject).to_not be_valid
    end
    it 'is not valid with a negative quantity' do
      subject.quantity = -2
      expect(subject).to_not be_valid
    end
  end
end
