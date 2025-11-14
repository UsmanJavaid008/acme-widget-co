# frozen_string_literal: true

class Offer
  # An offer must implement `apply(items)` where items is an array of Product
  # It should return a numeric discount (positive number) to subtract from subtotal
  def apply(items)
    raise NotImplementedError, 'Offer subclasses must implement apply(items)'
  end
end
