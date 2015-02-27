describe 'Marketplace' do

  before :each do
    @item_one = Product.new(name: "Lavender heart", code: '001', price: 9.25)
    @item_two = Product.new(name: "Personalised cufflinks", code: '002', price: 45.00)
    @item_three = Product.new(name: "Kids T-shirt", code: '003', price: 19.95)
    @item_four = Product.new(name: "Lavender heart", code: '001', price: 9.25)
    @basket = Basket.new
    @promotional_rules = PromotionalRules.new(spend_limit: 60, percentage: 0.9, code: '001', new_price: 8.50, quantity: 2)
    @co = Checkout.new(@promotional_rules)
  end
  
  context "test scenario one" do
    it "calculates the correct total for codes 001, 002, 003" do
      @basket.add(@item_one)
      @basket.add(@item_two)
      @basket.add(@item_three)
      @basket.contents.each { |product| @co.scan(product) }
      expect(@co.total).to eq 66.78
    end
  end

  context "test scenario two" do
    it "calculates the correct total for codes 001, 003, 001" do
      @basket.add(@item_one)
      @basket.add(@item_three)
      @basket.add(@item_four)
      @basket.contents.each { |product| @co.scan(product) }
      expect(@co.total).to eq 36.95
    end
  end

  context "test scenario three" do
    it "calculates the correct total for codes 001, 002, 001, 003" do
      @basket.add(@item_one)
      @basket.add(@item_two)
      @basket.add(@item_three)
      @basket.add(@item_four)
      @basket.contents.each { |product| @co.scan(product) }
      expect(@co.total).to eq 73.76
    end
  end

end