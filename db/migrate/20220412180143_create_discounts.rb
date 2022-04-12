class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :type_of_discount
      t.integer :min_quantity
      t.float :percentage
      t.integer :pay_one_get_more
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
