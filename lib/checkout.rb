class Checkout 

  attr_reader :product_list

  def initialize(promotional_rules)
    @promotion = promotional_rules
    @product_list = []
  end

  def scan(product)
    @product_list << product
  end

end