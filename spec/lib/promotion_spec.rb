# frozen_string_literal: true

require_relative '../spec_helper'

describe Promotion do
  it 'knows when to apply promotion' do
    promotion = described_class.new(border_quantity: 10, new_price: 5)
    expect(promotion.total_price(1, 10.0)).to eq 10
    expect(promotion.total_price(11, 10.0)).to eq 55
  end
end
