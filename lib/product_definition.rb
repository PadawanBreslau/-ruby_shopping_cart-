# frozen_string_literal: true

class ProductDefinition
  attr_reader :name, :code, :price, :promotions

  def initialize(name:, code:, price:)
    @name = name
    @code = code
    @price = price
    @promotions = []
  end

  def add_promotion(promotion)
    @promotions << promotion
  end
end
