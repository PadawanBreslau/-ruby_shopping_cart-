# frozen_string_literal: true

class Basket
  attr_reader :cart

  def initialize
    @cart = []
  end

  def price
    recount_price
  end

  def add_to_cart(product)
    @cart << product
  end

  private

  def recount_price
    123.54
  end
end
