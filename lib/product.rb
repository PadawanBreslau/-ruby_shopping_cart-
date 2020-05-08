# frozen_string_literal: true

class Product
  attr_accessor :quantity

  def initialize(product_definition:)
    @product_definition = product_definition
    @quantity = 1
  end

  def price
    default_price = @product_definition.price * @quantity

    @product_definition.promotions.any? ? best_promotion(@product_definition.promotions, @quantity) : default_price
  end

  def code
    @product_definition.code
  end

  private

  def best_promotion(promotions, quantity)
    promotions.map{|promotion| promotion.total_price(quantity)}.min
  end
end
