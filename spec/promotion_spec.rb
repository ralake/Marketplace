describe Promotion do

  let(:promotion) { Promotion.new }

  context "can have rules added" do
    it "for 10% off" do
      promotion.add_rule(name: "10% off", spend: 60, percent: 0.9)
      expect(promotion.rules[0][:name]).to eq "10% off"
    end

    it "for discounts on mulitple items" do
      promotion.add_rule(name: "multiple items", code: '001', price: 8.50)
      expect(promotion.rules[0][:code]).to eq '001'
    end
  end

  context "will not add rules that it cannot recognise" do
    it "will raise an error" do
      expect { promotion.add_rule(name: "multiple items", code: '001', test: 'test') }
        .to raise_error(InvalidParameterError)
    end
  end

  context "adjusts product prices" do
    it "when the total price is over a specific limit" do
      promotion.add_rule(name: "10% off", spend: 60, percent: 0.9)

    end
  end
  
end