require 'exceptions'

class Promotion

  attr_reader :rules
  attr_accessor :name, :spend, :percent, :code, :price

  def initialize
    @rules = []
  end

  def add_rule(options = {})
    options.keys.each do |key|
      if !rule_perameters.include?(key) then raise InvalidParameterError end
    end    
    @rules << options
  end

  private

  def rule_perameters
    [:name, :spend, :percent, :code, :price]
  end

end