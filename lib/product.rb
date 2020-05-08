# frozen_string_literal: true

class Product
  def initialize(price:)
    @price = price
  end

  def price(count = 1)
    @price * count
  end
end
