# frozen_string_literal: true
Dir['./lib/*.rb'].each { |file| require file }

shop = Shop.new
pd1 = ProductDefinition.new(name: 'T1', code: 'T1', price: 10.9)
pd2 = ProductDefinition.new(name: 'T2', code: 'T2', price: 1.9)
pd3 = ProductDefinition.new(name: 'T3', code: 'T3', price: 2.9)

pr1 = Promotion.new(product_definition: pd1, border_quantity: 2, new_price: 8.9)
pr2 = Promotion.new(product_definition: pd1, border_quantity: 5, new_price: 7.0)

bpr1 = BasketPromotion.new(border_value: 60.0, discount_percent: 10)
bpr2 = BasketPromotion.new(border_value: 100.0, discount_percent: 20)

pd1.add_promotion(pr1)
pd1.add_promotion(pr2)

shop.add_product(pd1)
shop.add_product(pd2)
shop.add_product(pd3)


basket = Basket.new
basket.add_to_cart(pd1)
basket.add_to_cart(pd1)

puts basket.total_price
puts basket.total_price == 17.8 ? 'Good' : 'Bad'

basket.add_to_cart(pd1)
basket.add_to_cart(pd1)
basket.add_to_cart(pd1)

puts basket.total_price
puts basket.total_price == 35.0 ? 'Good' : 'Bad'
