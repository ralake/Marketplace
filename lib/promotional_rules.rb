class PromotionalRules

  attr_reader :spend_limit, :percentage, :code, :price
  
  def initialize(options = {})
    @spend_limit = options.fetch(:spend_limit) { nil }
    @percentage = options.fetch(:percentage) { nil }
    @code = options.fetch(:code) { nil }
    @price = options.fetch(:price) { nil } 
  end

  def apply_to(products)
    if products.count { |product| product.code == code } >= 2
      products.each { |product| product.price = price }
    end
  end

end