# frozen_string_literal: true

require_relative 'product'

class ProductCatalogue
  def initialize(products = [])
    # products: array of Product instances
    @products_by_code = products.map { |p| [p.code, p] }.to_h
  end

  def add(product)
    @products_by_code[product.code] = product
  end

  def find(code)
    @products_by_code[code]
  end
end
