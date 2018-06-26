require 'spec_helper'

describe Checkout do
  ProductStub = Struct.new(:code, :name, :price, :del_price)
  subject { Checkout.new }

  describe "on setup" do
    it 'should start with an empty basket' do
      expect(subject.basket.count).to eq(0)
    end
    it 'should start with zero price' do
      expect(subject.total).to eq(0)
    end
  end

  context 'with no promo_rules' do
    describe 'scan items' do
      let(:product1) { ProductStub.new('001', 'name', 10, 5.00) }
      let(:product2) { ProductStub.new('002', 'here', 10, 5.00) }

      it 'should calculate total as the product price plus delivery price' do
        subject.scan(product1)
        subject.scan(product2)
        expect(subject.total).to eq(30)
      end

      it 'should round total to two decimal places' do
        product = ProductStub.new('001', 'name', 25.4552, 5.00)
        subject.scan(product)
        expect(subject.total).to eq(30.46)
      end
    end
  end

  context 'with promo_rules' do
    let(:product1) { ProductStub.new('001', 'name', 10) }
    let(:product2) { ProductStub.new('002', 'here', 10) }
  end

end
