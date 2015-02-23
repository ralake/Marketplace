require './lib/product'

describe Product do
  
  it "has a product code" do
    product = Product.new("Lavender Heart")
    expect(product.name).to eq "Lavender Heart"
  end

end