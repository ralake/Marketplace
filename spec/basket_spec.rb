describe Basket do

  let(:basket)  { Basket.new } 
  let(:product) { instance_double(Product) }
  
  context '#initialze' do
    it "is empty" do
      expect(basket.contents).to eq []
    end
  end

  context "adds and removes products" do
    it "can add products" do
      basket.add(product)
      expect(basket.contents).to eq [product]
    end

    it "can remove products" do
      basket.add(product)
      basket.remove(product)
      expect(basket.contents).to eq []
    end
  end

end