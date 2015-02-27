class PromotionalRules

  attr_reader :spend_limit, :percentage, :code, :price, :quantity
  
  def initialize(options = {})
    options.each { |parameter, value| instance_variable_set("@#{parameter}", value)}
  end

  def apply_to(products)
    multi_buy_discount(products)
    percentage_discount(products)
  end

  private

  def multi_buy_discount(products)
    if products.count { |product| product.code == code } >= quantity
      products.each { |product| product.price = price }
    end
  end

  def percentage_discount(products)
    if products.map { |product| product.price }.inject(:+) > spend_limit
      products.each { |product| product.price = product.price * percentage }
    end
  end

end