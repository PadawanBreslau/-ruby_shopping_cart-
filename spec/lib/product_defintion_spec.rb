# frozen_string_literal: true

require_relative '../spec_helper'

describe ProductDefinition do
  it 'can add promotion to product defintion' do
    definition = described_class.new(name: 'Porsche', code: 'P01', price: '4500000')
    promotion = Promotion.new(border_quantity: 2, new_price: 400_000)
    definition.add_promotion(promotion)

    expect(definition.promotions).to eq [promotion]
  end
end
