class Product

  attr_accessor :price
  attr_reader :name, :code

  def initialize(options = {})
    options.each { |parameter, value| instance_variable_set("@#{parameter}", value) }
  end

end