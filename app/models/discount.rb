class Discount < ApplicationRecord
  belongs_to :product
  validates :type_of_discount, presence: true
  validates :min_quantity, numericality: { greater_than: 0 }
  validates :pay_one_get_more, numericality: { only_integer: true }
end
