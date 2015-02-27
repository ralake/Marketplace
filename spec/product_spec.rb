describe Product do

  let(:product) { Product.new(name: "Lavender Heart", code: '001', price: 9.25) }

  context '#initialze' do
    it "with a name" do
      expect(product.name).to eq "Lavender Heart"
    end

    it "with a product code" do
      expect(product.code).to eq '001'
    end

    it "with a price" do
      expect(product.price).to eq 9.25
    end
  end

end