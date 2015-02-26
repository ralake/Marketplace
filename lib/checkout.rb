class Checkout 

  attr_reader :product_list

  def initialize(promotions)
    @promotions = promotions
    @product_list = []
  end

  def scan(product)
    @product_list << product
  end

  def total
    prices = @product_list.map { |product| product.price }.inject(:+)
  end

end