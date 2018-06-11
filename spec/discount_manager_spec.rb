require 'spec_helper'

describe DiscountManager do
  let(:promo_rule) {double('promo_rule')}
  let(:product) { Struct.new(:code, :name, :price).new('001', 'foobar', 10.97) }
  subject { DiscountManager.new([promo_rule]) }

  describe '#discount_price_for' do
    before do
      allow(promo_rule).to receive(:type) { PromoRule::TYPE[:multi_discount] }
      allow(promo_rule).to receive(:apply) { 60 }
    end

    it 'should pass the calculation to the promo_rule with params' do
      expect(promo_rule).to receive(:type) { PromoRule::TYPE[:multi_discount] }
      expect(promo_rule).to receive(:apply).with(product.code, 2)

      subject.discount_price_for(product, 2)
    end

    it 'should return the discounted price when rule applied' do
      price = subject.discount_price_for(product, 2)
      expect(price).to eq(60)
    end

    it 'should return the original price if no rule applied' do
      discount_manager = DiscountManager.new

      price = discount_manager.discount_price_for(product, 1)
      expect(price).to eq(product.price)
    end

  end

  describe '#discount_total' do
    before do
      allow(promo_rule).to receive(:type) { PromoRule::TYPE[:discount] }
      allow(promo_rule).to receive(:apply) { 100 }
    end

    it 'should pass the calculation to the rule with subtotal' do
      expect(promo_rule).to receive(:type) { PromoRule::TYPE[:discount] }
      expect(promo_rule).to receive(:apply).with(10)

      subject.discount_total(10)
    end

    it 'should return the calculated total when rule applied' do
      total = subject.discount_total(10)
      expect(total).to eq(100)
    end

    it 'should return original subtotal if no rule match' do
      discount_manager = DiscountManager.new

      total = discount_manager.discount_total(10)
      expect(total).to eq(10)
    end

  end
end
