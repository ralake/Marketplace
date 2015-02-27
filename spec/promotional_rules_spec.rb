describe PromotionalRules  do

  let(:promotional_rules) { PromotionalRules.new({ spend_limit: 60,
                                                   percentage: 0.9,
                                                   code: '001',
                                                   price: 8.50 }) }
  let(:product_one) { instance_double(Product) }
  let(:product_two) { instance_double(Product) }

  before :each do
    @products = [product_one, product_two]
  end
  
  context "#initialize" do
    it "with options for a percentage discount based on spend" do
      expect(promotional_rules.spend_limit).to eq 60
      expect(promotional_rules.percentage).to eq 0.9
    end

    it "with options for a mulit-buy discount for specific products" do
      expect(promotional_rules.code).to eq '001'
      expect(promotional_rules.price).to eq 8.50
    end
  end 

  context "multi-buy discount" do
    it "is applied to products with a specific code" do
      allow(product_two).to receive(:code).and_return '001'
      allow(product_one).to receive(:code).and_return '001'
      expect(product_one).to receive(:price=).with 8.50
      expect(product_two).to receive(:price=).with 8.50
      promotional_rules.apply_to(@products)
    
    end

    it "is not applied to products with the wrong code" do
      allow(product_one).to receive(:code).and_return '002'
      allow(product_two).to receive(:code).and_return '002'
      expect(product_one).not_to receive(:price=).with 8.50
      expect(product_two).not_to receive(:price=).with 8.50
      promotional_rules.apply_to(@products)
    end
  end

end