describe Checkout do

  let(:basket)      { instance_double(Basket) }
  let(:product_one) { instance_double(Product) }
  let(:product_two) { instance_double(Product) }
  let(:checkout)    { Checkout.new(:promotional_rules) }


  context '#initialize' do

    it 'with promotional rules' do
      expect { checkout_two = Checkout.new(:promotional_rules) }.not_to raise_error
    end

  end

  context '#scan' do

    it 'a product' do
      checkout.scan(product_one)
      expect(checkout.product_list).to eq [product_one]
    end

  end

end