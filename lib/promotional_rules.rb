class PromotionalRules

  attr_reader :spend_limit, :percentage, :code, :price
  
  def initialize(options = {})
    options.each { |parameter, value| instance_variable_set("@#{parameter}", value)}
  end

  def apply_to(products)
    multi_buy_discount(products)
  end

  private

  def multi_buy_discount(products)
    if products.count { |product| product.code == code } >= 2
      products.each { |product| product.price = price }
    end
  end

end