class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def total_cost
    discount = product.discount
    if quantity >= discount.min_quantity
      if discount.type_of_discount === 'percentage'
        (product.price * discount.percentage * quantity).round(2)
      elsif discount.type_of_discount === 'pay_one_get_more'
        product.price * quantity
      end
    else
      product.price * quantity
    end
  end
end
