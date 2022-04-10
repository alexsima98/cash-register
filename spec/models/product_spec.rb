require 'rails_helper'

RSpec.describe Product, type: :model do
  subject do
    described_class.new(product_code: 'SR1', name: 'Strawberry', price: 5.00)
  end
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a product code' do
      subject.product_code = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid with a product code shorter than 3 characters' do
      subject.product_code = 'SR'
      expect(subject).not_to be_valid
    end
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a price' do
      subject.price = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid with a neutral price' do
      subject.price = 0
      expect(subject).not_to be_valid
    end
    it 'is not valid with a negative price' do
      subject.price = -1
      expect(subject).not_to be_valid
    end
  end
end
