require 'exceptions'

class Promotion

  attr_reader :rules
  attr_accessor :name, :spend, :percent, :code, :price

  def initialize
    @rules = nil
  end

  def add_rule(options = {})
    options.keys.each do |key|
      if !rule_perameters.include?(key) then raise InvalidParameterError end
    end    
    @rules = options
  end

  def apply_to(products, total)
    if rules[:name] == 'percentage discount' && rules[:spend] < total
      products.each do |product|
        product.price = product.price * rules[:percent]
      end
    end
  end

  private

  def rule_perameters
    [:name, :spend, :percent, :code, :price]
  end

end