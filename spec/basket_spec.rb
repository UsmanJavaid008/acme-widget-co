# frozen_string_literal: true

require 'spec_helper'
require 'product'
require 'product_catalogue'
require 'delivery_rules'
require 'offers/bogof_half_price_red'
require 'basket'

RSpec.describe 'Acme Basket' do
  let(:red) { Product.new(code: 'R01', name: 'Red Widget', price: 32.95) }
  let(:green) { Product.new(code: 'G01', name: 'Green Widget', price: 24.95) }
  let(:blue) { Product.new(code: 'B01', name: 'Blue Widget', price: 7.95) }

  let(:catalogue) { ProductCatalogue.new([red, green, blue]) }

  let(:delivery_rules) do
    DeliveryRules.new([
      DeliveryRule.new(0.0, 4.95),
      DeliveryRule.new(50.0, 2.95),
      DeliveryRule.new(90.0, 0.0)
    ])
  end

  let(:offers) { [BogofHalfPriceRed.new] }

  def new_basket
    Basket.new(catalogue: catalogue, delivery_rules: delivery_rules, offers: offers)
  end

  it 'returns $37.85 for B01, G01' do
    basket = new_basket
    basket.add('B01')
    basket.add('G01')
    expect(basket.total).to eq('$37.85')
  end

  it 'returns $54.37 for R01, R01' do
    basket = new_basket
    basket.add('R01')
    basket.add('R01')
    expect(basket.total).to eq('$54.37')
  end

  it 'returns $60.85 for R01, G01' do
    basket = new_basket
    basket.add('R01')
    basket.add('G01')
    expect(basket.total).to eq('$60.85')
  end

  it 'returns $98.27 for B01, B01, R01, R01, R01' do
    basket = new_basket
    basket.add('B01')
    basket.add('B01')
    basket.add('R01')
    basket.add('R01')
    basket.add('R01')
    expect(basket.total).to eq('$98.27')
  end
end
