# frozen_string_literal: true

require_relative '../offer'

class BogofHalfPriceRed < Offer
  RED_CODE = 'R01'.freeze

  def apply(items)
    # Count red widgets
    reds = items.select { |i| i.code == RED_CODE }

    # For every pair, the second is half price -> discount = half of price for each pair
    pairs = reds.count / 2
    return 0.0 if pairs.zero?

    # Assume all red widgets have same price; take price from first
    price = reds.first.price
    discount = pairs * (price / 2.0)

    discount
  end
end
