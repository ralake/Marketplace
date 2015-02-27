class Checkout 

  attr_reader :products

  def initialize(promotion)
    @promotion = promotion
    @products = []
  end

  def scan(product)
    products << product
  end

  def total
    @promotion.apply_to(products)
    products.map { |product| product.price }.inject(:+).round(2)
  end

end