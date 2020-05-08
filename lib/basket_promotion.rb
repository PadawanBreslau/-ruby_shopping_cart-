# frozen_string_literal: true

class BasketPromotion
  def initialize(border_value:, discount_percent:)
    @border_value = border_value
    @discount_percent = discount_percent
  end

  def should_apply_promotion?(value)
    value >= @border_value
  end

  def total_price(value)
    should_apply_promotion?(value) ? (100-@discount_percent.to_f) * value : value
  end
end
