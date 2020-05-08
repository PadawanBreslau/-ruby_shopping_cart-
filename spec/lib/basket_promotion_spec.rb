# frozen_string_literal: true

require_relative '../spec_helper'

describe BasketPromotion do
  it 'knows when to apply promotion' do
    basket_promotion = described_class.new(border_value: 10, discount_percent: 5)
    expect(basket_promotion.total_price(3)).to eq 3
    expect(basket_promotion.total_price(10)).to eq 9.5
  end
end
