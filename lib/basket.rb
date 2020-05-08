# frozen_string_literal: true

class Basket
  attr_reader :cart

  def initialize(shop:)
    @shop = shop
    @cart = []
    @promotions = []
  end

  def total_price
    recount_price
  end

  def add_to_cart(product_definition)
    if already_stocked?(product_definition)
      increase_quantity!
    else
      @cart << Product.new(product_definition: product_definition)
    end
  end

  private

  def already_stocked?(product_definition)
    @stocked_item = @cart.find { |product| product.code == product_definition.code }
  end

  def increase_quantity!
    @stocked_item.quantity += 1
  end

  def stocked_item_price
    @cart.map(&:price).inject(:+)
  end

  def recount_price
    apply_basket_discount(stocked_item_price)
  end

  def apply_basket_discount(item_price)
    @shop.best_discount(item_price)
  end
end
