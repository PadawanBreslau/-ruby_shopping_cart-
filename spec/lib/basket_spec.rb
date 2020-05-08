# frozen_string_literal: true

require_relative '../spec_helper'

describe Basket do
  it 'generates empty basker' do
    basket = Basket.new
    expect(basket.cart).to be_empty
  end
end
