require 'spec_helper'

describe Product do
  subject { Product.new('001', 'cheap chair', 9.25, 5.00) }

  it 'should return correct product code' do
    expect(subject.code).to eq('001')
  end

  it 'should return correct product name' do
    expect(subject.name).to eq('cheap chair')
  end

  it 'should return correct price' do
    expect(subject.price).to eq(9.25)
  end

  it 'should return del_price' do
    expect(subject.del_price).to eq(5.00)
  end
end
