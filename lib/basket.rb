# frozen_string_literal: true

require_relative 'product_catalogue'
require_relative 'delivery_rules'
require_relative 'offer'

class Basket
  attr_reader :items

  def initialize(catalogue:, delivery_rules:, offers: [])
    @catalogue = catalogue
    @delivery_rules = delivery_rules
    @offers = offers
    @items = []
  end

  # add by product code
  def add(code)
    product = @catalogue.find(code)
    raise ArgumentError, "Unknown product code: #{code}" unless product

    @items << product
    product
  end

  # returns a formatted string like "$37.85"
  def total
    subtotal = raw_subtotal
    total_discount = apply_offers
    after_offer = subtotal - total_discount
    delivery = @delivery_rules.cost_for(after_offer)
    final = after_offer + delivery

    format_money(truncate_two_decimal(final))
  end

  def raw_subtotal
    @items.map(&:price).reduce(0.0, :+)
  end

  def apply_offers
    @offers.map { |offer| offer.apply(@items) }.reduce(0.0, :+)
  end

  private

  def truncate_two_decimal(value)
    (value * 100).floor / 100.0
  end

  def format_money(value)
    format('$%.2f', value)
  end
end
