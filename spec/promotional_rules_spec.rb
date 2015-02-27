describe PromotionalRules  do

  let(:promotional_rules) { PromotionalRules.new({ spend_limit: 60,
                                                   percentage: 0.9,
                                                   code: '001',
                                                   new_price: 8.50,
                                                   quantity: 2 }) }
  let(:product_one)       { instance_double(Product) }
  let(:product_two)       { instance_double(Product) }

  before :each do
    @products = [product_one, product_two]
    allow(product_one).to receive(:code).and_return '002'
    allow(product_two).to receive(:code).and_return '002'
    allow(product_one).to receive(:price).and_return 9.25
    allow(product_two).to receive(:price).and_return 9.25
  end
  
  it "#initialize with options for discounts" do
    expect { PromotionalRules.new({ spend_limit: 60, percentage: 0.9 }) }.not_to raise_error
  end

  context "multi-buy discount" do
    it "is applied to products with a specific code and quantity" do
      allow(product_one).to receive(:code).and_return '001'
      allow(product_two).to receive(:code).and_return '001'
      expect(product_one).to receive(:price=).with 8.50
      expect(product_two).to receive(:price=).with 8.50
      promotional_rules.apply_to(@products)
    end

    it "is not applied to products with the wrong code" do
      expect(product_one).not_to receive(:price=)
      expect(product_two).not_to receive(:price=)
      promotional_rules.apply_to(@products)
    end
  end

  context "percentage discount" do
    it "is applied when the total is above the limit set in the rules" do
      allow(product_one).to receive(:price).and_return 40
      allow(product_two).to receive(:price).and_return 50
      expect(product_one).to receive(:price=).with 36
      expect(product_two).to receive(:price=).with 45
      promotional_rules.apply_to(@products)
    end

    it "is not applied when the total is below the limit set in the rules" do
      allow(product_one).to receive(:price).and_return 25
      allow(product_two).to receive(:price).and_return 20
      expect(product_one).not_to receive(:price=)
      expect(product_two).not_to receive(:price=)
      promotional_rules.apply_to(@products)
    end
  end

end
