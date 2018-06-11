require 'spec_helper'

describe PromoRule do
  subject { PromoRule.new(PromoRule::TYPE[:discount]) {} }

  describe '#type' do
    it 'should return type as value' do
      expect(subject.type).to eq(1)
    end
  end

  describe 'discount_promo_rule method' do
   subject { PromoRule.discount_rule(60, 10) }

   it 'should be instance of PromoRule' do
     expect(subject).to be_a_kind_of(PromoRule)
   end
 end

 describe 'creating discount_promo_rule processor' do
    it 'should call block with no arguments' do
      value = false
      promo_rule = PromoRule.new(PromoRule::TYPE[:discount]) do
        value = true
      end
      expect(promo_rule.apply).to be_truthy
    end

    it 'should not call block with one argument' do
      promo_rule = PromoRule.new(PromoRule::TYPE[:discount]) do |value|
        value
      end
      expect(promo_rule.apply('foo')).not_to eq('foo')
    end

    it 'should call block with two arguments' do
      promo_rule = PromoRule.new(PromoRule::TYPE[:discount]) do |value1, value2|
        "#{value1}-#{value2}"
      end
      expect(promo_rule.apply('foo', 'bar')).to eq('foo-bar')
    end

    it 'should not call block with three arguments' do
      promo_rule = PromoRule.new(PromoRule::TYPE[:discount]) do |value1, value2, value3|
        "#{value1}-#{value2}-#{value3}"
      end
      expect(promo_rule.apply('foo', 'bar', 'baz')).to eq('foo-bar-baz')
    end

  end

end
