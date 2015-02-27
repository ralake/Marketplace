describe Basket do

  let(:basket)  { Basket.new } 
  let(:product) { instance_double(Product) }

  it "initializes empty" do
    expect(basket.contents).to eq []
  end

  context "adds and removes products" do
    it "adds products" do
      basket.add(product)
      expect(basket.contents).to eq [product]
    end

    it "removes products" do
      basket.add(product)
      basket.remove(product)
      expect(basket.contents).to eq []
    end
  end

end
