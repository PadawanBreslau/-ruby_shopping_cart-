# frozen_string_literal: true

class Promotion
  def initialize(border_quantity:, new_price:)
    @border_quantity = border_quantity
    @new_price = new_price
  end

  def should_apply_promotion?(quantity)
    quantity >= @border_quantity
  end

  def promotional_price(quantity, old_price)
    should_apply_promotion?(quantity) ? @new_price : old_price
  end

  def total_price(quantity, old_price)
    quantity * promotional_price(quantity, old_price)
  end
end
