class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy

  def total_cost
    cost = 0
    cart_products.each do |product|
      cost += product.total_cost
    end
    cost
  end
end
