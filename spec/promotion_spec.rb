describe Promotion do

  let(:ten_percent_off) { Promotion.new }
  let(:product_one)     { double :product, price: 70 }
  let(:product_two)     { double :product, price: 30 }

  before :all do
    @rule = { name: "percentage discount", spend: 60, percent: 0.9 }
  end

  it "adds rules with specific parameters" do
    ten_percent_off.add_rule(@rule)
    expect(ten_percent_off.rules).to eq @rule
  end

  it "will not add rules with invalid parameters" do
    expect { ten_percent_off.add_rule(test: 'test') }.to raise_error(InvalidParameterError)
  end

  context "adjusts product prices" do
    it "when the total price is over a specific limit" do
      products = [product_one]
      total = product_one.price
      ten_percent_off.add_rule(@rule)
      expect(product_one).to receive(:price=).and_return 36
      ten_percent_off.apply_to(products, total)
    end
  end
  
end