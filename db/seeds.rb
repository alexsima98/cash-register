products_data = [{ product_code: 'GR1', name: 'Green Tea', price: 3.11 },
                 { product_code: 'SR1', name: 'Strawberries', price: 5.00 },
                 { product_code: 'CF1', name: 'Coffee', price: 11.23 }]

puts 'Products...'
products_data.each do |data|
  if Product.find_by(product_code: data[:product_code])
    puts "Product with product_code #{data[:product_code]} already created"
  else
    puts "Creating product with product_code #{data[:product_code]}..."
    Product.create(data)
    puts 'Succesfully created Product model'
  end
end
puts 'Products done!'

discounts_data = [{ type_of_discount: 'pay_one_get_more', pay_one_get_more: 1, min_quantity: 1,
                    product: Product.find_by(product_code: 'GR1') },
                  { type_of_discount: 'percentage', percentage: 9.0 / 10, min_quantity: 3,
                    product: Product.find_by(product_code: 'SR1') },
                  { type_of_discount: 'percentage', percentage: 6.6 / 10, min_quantity: 3,
                    product: Product.find_by(product_code: 'CF1') }]

puts 'Discounts...'
discounts_data.each do |data|
  if Discount.find_by(product: data[:product])
    puts "Discount for product #{data[:product].name} already created"
  else
    puts "Creating discount for product #{data[:product].name}..."
    Discount.create(data)
    puts 'Succesfully created discount model'
  end
end
puts 'Discounts done!'
