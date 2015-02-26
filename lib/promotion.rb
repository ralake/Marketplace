class Promotion

  attr_reader :rules
  attr_accessor :name, :spend, :percent, :code, :price

  def initialize
    @rules = []
  end

  def add_rule(options = {})
    rule = options
    @rules << rule
  end

end