class Basket 

  def contents
    @contents ||= []
  end

  def add(product)
    contents << product
  end

  def remove(product)
    contents.delete(product)
  end

end