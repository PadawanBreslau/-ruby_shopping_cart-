# frozen_string_literal: true

class Shop
  attr_reader :product_definitions, :promotions

  def initialize
    @product_definitions = []
    @promotions = []
  end

  def add_product(new_definition)
    if product_with_same_code(new_definition.code)
      @same_product.name = new_definition.name
      @same_product.price = new_definition.price
    else
      @product_definitions << new_definition
    end
  end

  def add_promotion(promotion)
    @promotions << promotion
  end

  def best_discount(value)
    @promotions.map { |promotion| promotion.total_price(value) }.min || value
  end

  private

  def product_with_same_code(code)
    @same_product = @product_definitions.find { |definition| definition.code == code }
  end
end
