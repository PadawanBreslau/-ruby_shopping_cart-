# frozen_string_literal: true

require_relative '../spec_helper'

describe Shop do
  it 'has no product and definition at start' do
    shop = Shop.new
    expect(shop.product_definitions).to be_empty
    expect(shop.promotions).to be_empty
  end

  it 'has an item after adding it' do
    shop = Shop.new
    product_definition = ProductDefinition.new(name: 'Scarf', price: 12.0, code: 'S01')
    shop.add_product(product_definition)
    expect(shop.product_definitions).to eq [product_definition]
  end

  it 'doesnt duplicate an item' do
    shop = Shop.new
    product_definition = ProductDefinition.new(name: 'Scarf', price: 12.0, code: 'S01')
    product_definition2 = ProductDefinition.new(name: 'Gloves', price: 12.0, code: 'S01')
    shop.add_product(product_definition)
    shop.add_product(product_definition2)

    expect(shop.product_definitions.size).to eq 1
    expect(shop.product_definitions.first.name).to eq 'Gloves'
  end

  it 'has a promotion after adding it' do
    shop = Shop.new
    promotion = BasketPromotion.new(border_value: 100, discount_percent: 10)
    shop.add_promotion(promotion)

    expect(shop.promotions).to eq [promotion]
  end

  it 'gives the client discount' do
    shop = Shop.new
    promotion = BasketPromotion.new(border_value: 100, discount_percent: 10)
    shop.add_promotion(promotion)

    expect(shop.best_discount(120)).to eq 108.0
  end
end
