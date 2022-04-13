require 'rails_helper'

RSpec.describe Discount, type: :model do
  subject do
    described_class.new(type_of_discount: 'percentage', percentage: 9.0 / 10, min_quantity: 3, product: Product.find_by(product_code: 'SR1'))
  end
  describe 'Association' do
    it { should belong_to :product }
  end
  describe 'Validations' do
    it 'is not valid without a type_of_discount' do
      subject.type_of_discount = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a min_quantity' do
      subject.min_quantity = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid with a neutral min_quantity' do
      subject.min_quantity = 0
      expect(subject).not_to be_valid
    end
    it 'is not valid with a negative min_quantity' do
      subject.min_quantity = -3
      expect(subject).not_to be_valid
    end
  end
end
