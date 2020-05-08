# frozen_string_literal: true

require_relative '../spec_helper'

describe Basket do
  it 'generates empty basket' do
    shop = Shop.new
    basket = Basket.new(shop: shop)
    expect(basket.cart).to be_empty
  end

  it 'can add item to cart' do
    shop = Shop.new
    basket = Basket.new(shop: shop)
    product_definition = ProductDefinition.new(name: 'Cake', price: 12.0, code: 'S01')
    basket.add_to_cart(product_definition)
    expect(basket.cart.first.product_definition).to eq product_definition
    expect(basket.cart.first.quantity).to eq 1
  end

  it 'can add more item of one type to cart' do
    shop = Shop.new
    basket = Basket.new(shop: shop)
    product_definition = ProductDefinition.new(name: 'Cake', price: 12.0, code: 'S01')
    basket.add_to_cart(product_definition)
    basket.add_to_cart(product_definition)
    basket.add_to_cart(product_definition)
    expect(basket.cart.first.product_definition).to eq product_definition
    expect(basket.cart.first.quantity).to eq 3
  end

  it 'can add more item of one type to cart' do
    shop = Shop.new
    basket = Basket.new(shop: shop)
    product_definition = ProductDefinition.new(name: 'Cake', price: 12.0, code: 'S01')
    product_definition2 = ProductDefinition.new(name: 'Coke', price: 2.0, code: 'S02')
    basket.add_to_cart(product_definition)
    basket.add_to_cart(product_definition)
    basket.add_to_cart(product_definition2)
    expect(basket.cart.size).to eq 2
    expect(basket.cart.map(&:product_definition)).to eq [product_definition, product_definition2]
  end

  it 'discard order of puting items' do
    shop = Shop.new
    basket = Basket.new(shop: shop)
    product_definition = ProductDefinition.new(name: 'Cake', price: 12.0, code: 'S01')
    product_definition2 = ProductDefinition.new(name: 'Coke', price: 2.0, code: 'S02')
    basket.add_to_cart(product_definition)
    basket.add_to_cart(product_definition2)
    basket.add_to_cart(product_definition)
    expect(basket.cart.size).to eq 2
    expect(basket.cart.map(&:product_definition)).to eq [product_definition, product_definition2]
    expect(basket.cart.first.quantity).to eq 2
  end

  context 'with price calculations' do
    it 'should calculate total price' do
      shop = Shop.new
      basket = Basket.new(shop: shop)
      product_definition = ProductDefinition.new(name: 'Cake', price: 12.0, code: 'S01')
      product_definition2 = ProductDefinition.new(name: 'Coke', price: 2.0, code: 'S02')
      basket.add_to_cart(product_definition)
      basket.add_to_cart(product_definition2)
      expect(basket.cart.size).to eq 2
      expect(basket.total_price).to eq 14.0
    end

    it 'should take promotions into account' do
      shop = Shop.new
      pd1 = ProductDefinition.new(name: 'T1', code: 'T1', price: 10.9)
      pd2 = ProductDefinition.new(name: 'T2', code: 'T2', price: 1.9)
      pd3 = ProductDefinition.new(name: 'T3', code: 'T3', price: 2.9)
      pd4 = ProductDefinition.new(name: 'T4', code: 'T4', price: 50)

      pr1 = Promotion.new(border_quantity: 2, new_price: 8.9)
      pr2 = Promotion.new(border_quantity: 5, new_price: 7.0)

      bpr1 = BasketPromotion.new(border_value: 60.0, discount_percent: 10)
      bpr2 = BasketPromotion.new(border_value: 100.0, discount_percent: 20)

      pd1.add_promotion(pr1)
      pd1.add_promotion(pr2)
      shop.add_promotion(bpr1)
      shop.add_promotion(bpr2)

      shop.add_product(pd1)
      shop.add_product(pd2)
      shop.add_product(pd3)

      basket = Basket.new(shop: shop)
      basket.add_to_cart(pd1)
      basket.add_to_cart(pd1)

      expect(basket.total_price).to eq 17.8

      basket.add_to_cart(pd1)
      basket.add_to_cart(pd1)
      basket.add_to_cart(pd1)

      expect(basket.total_price).to eq 35.0

      basket.add_to_cart(pd4)
      expect(basket.total_price).to eq 76.5

      basket.add_to_cart(pd4)
      expect(basket.total_price).to eq 108
    end
  end
end
