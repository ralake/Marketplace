describe Checkout do

  let(:basket)            { instance_double(Basket) }
  let(:product_one)       { instance_double(Product) }
  let(:product_two)       { instance_double(Product) }
  let(:promotional_rules) { instance_double(PromotionalRules) }
  let(:checkout)          { Checkout.new(promotional_rules) }

  before :each do
    checkout.scan(product_one)
  end

  it 'initializes with promotions' do
    expect { checkout_two = Checkout.new(:promotional_rules) }.not_to raise_error
  end

  it 'scans a product' do
    expect(checkout.product_list).to eq [product_one]
  end

  it 'totals the price of all scanned products' do
    checkout.scan(product_two)
    allow(product_one).to receive(:price).and_return 5
    allow(product_two).to receive(:price).and_return 6
    allow(promotional_rules).to receive(:apply_to)
    expect(checkout.total).to eq 11
  end

end