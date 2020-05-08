# frozen_string_literal: true

class ProductDefinition
  attr_reader :code, :promotions
  attr_accessor :name, :price

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
