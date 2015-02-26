class Product

  attr_accessor :price
  attr_reader :name, :code

  def initialize(name, code, price)
    @name = name
    @code = code
    @price = price
  end

end