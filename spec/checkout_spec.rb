describe Checkout do

  let(:basket)      { instance_double(Basket) }
  let(:product_one) { instance_double(Product) }
  let(:product_two) { instance_double(Product) }
  let(:checkout)    { Checkout.new(:promotions) }

  before :each do
    checkout.scan(product_one)
  end

  context '#initialize' do
    it 'with promotions' do
      expect { checkout_two = Checkout.new(:promotions) }.not_to raise_error
    end
  end

  context 'scans' do
    it 'a product' do
      expect(checkout.product_list).to eq [product_one]
    end
  end

  context 'totals' do
    it 'the price of all scanned products' do
      checkout.scan(product_two)
      allow(product_one).to receive(:price).and_return 5
      allow(product_two).to receive(:price).and_return 6
      expect(checkout.total).to eq 11
    end
  end

end