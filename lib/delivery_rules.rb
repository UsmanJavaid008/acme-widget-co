# frozen_string_literal: true

require_relative 'delivery_rule'

class DeliveryRules
  def initialize(rules = [])
    # rules: array of DeliveryRule
    # we'll sort ascending by threshold
    @rules = rules.sort_by(&:threshold)
  end

  def cost_for(subtotal)
    # Find the highest threshold that is <= subtotal
    rule = @rules.reverse.find { |r| subtotal >= r.threshold }
    rule ? rule.cost : 0.0
  end
end
