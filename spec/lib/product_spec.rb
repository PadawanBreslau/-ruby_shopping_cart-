# frozen_string_literal: true

require_relative '../spec_helper'

describe Product do
  it 'knows a price for items' do
    product = Product.new(price: 0.99)
    expect(product.price).to eq 0.99
    expect(product.price(2)).to eq 1.98
  end
end
