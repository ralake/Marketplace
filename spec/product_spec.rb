describe Product do

  let(:product) { Product.new("Lavender Heart", 001, 9.25) }

  context '#initialze' do

    it "is initilaized with a name" do
      expect(product.name).to eq "Lavender Heart"
    end

    it "is initalized with a product code" do
      expect(product.code).to eq 001
    end

    it "is initialized with a price" do
      expect(product.price).to eq 9.25
    end

  end

end