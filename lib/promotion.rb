# frozen_string_literal: true

class Promotion
  def initialize(product_definition:, border_quantity:, new_price:)
    @product_definition = product_definition
    @border_quantity = border_quantity
    @new_price = new_price
  end

  def should_apply_promotion?(value)
    value >= @border_quantity
  end

  def promotional_price(value)
    should_apply_promotion?(value) ? @new_price : @product_definition.price
  end

  def total_price(value)
    value * promotional_price(value)
  end
end
