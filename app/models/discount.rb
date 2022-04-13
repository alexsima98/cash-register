class Discount < ApplicationRecord
  belongs_to :product
  validates :type_of_discount, presence: true
  validates :min_quantity, numericality: { greater_than: 0 }
end
