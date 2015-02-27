class Product

  attr_accessor :price
  attr_reader :name, :code

  def initialize(options = {})
    @name = options.fetch(:name)
    @code = options.fetch(:code)
    @price = options.fetch(:price)
  end

end