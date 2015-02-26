require './lib/basket'

describe Basket do

  let(:basket)  { Basket.new } 
  let(:product) { double :product }
  
  context '#initialze' do

    it "is empty" do
      expect(basket.contents).to eq []
    end

  end

  context "adding and removing products" do

    it "can hold products" do
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