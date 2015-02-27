class Product

  attr_accessor :price
  attr_reader :name, :code

  def initialize(options = {})
    options.each { |variable, value| instance_variable_set("@#{variable}", value) }
  end

end