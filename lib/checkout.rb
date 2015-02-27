class Checkout 

  attr_reader :product_list

  def initialize(promotion)
    @promotions = promotion
    @product_list = []
  end

  def scan(product)
    @product_list << product
  end

  def total
    @product_list.map { |product| product.price }.inject(:+)
  end

end