class Cart < ApplicationRecord
  has_many :items, class_name: "CartProduct", dependent: :destroy
end
