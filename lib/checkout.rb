class Checkout 

  attr_reader :products

  def initialize(promotional_rules)
    @promotion = promotional_rules
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