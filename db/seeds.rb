products = [
  {code: 'GR1', name: 'Grean Tea', price: 3.11, discount_limit: 2 ,discounted_price: nil, discount_percentage: nil ,discount_type: "one_per_one" },
  {code: 'SR1', name: 'Strawberries', price: 5.0, discount_limit: 3,discounted_price: 4.5 ,discount_percentage: nil ,discount_type: "fixed" },
  {code: 'CF1', name: 'Coffee', price: 11.23, discount_limit: 3 ,discounted_price: nil,discount_percentage: 666667 ,discount_type: "percentage" },

]
products.map do |product_row|
  Product.where(product_row).first_or_create!
end