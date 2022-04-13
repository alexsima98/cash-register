class Product < ApplicationRecord
  has_one :discount, dependent: :destroy
  validates :name, presence: true
  validates :product_code, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
