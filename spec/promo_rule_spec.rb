require 'spec_helper'

describe PromoRule do
  subject { PromoRule.new(PromoRule::TYPE[:discount]) {} }

  describe '#type' do
    it 'should return type as value' do
      expect(subject.type).to eq(1)
    end
  end


end
