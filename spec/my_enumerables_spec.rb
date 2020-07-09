# spec/my_enumerables_spec.rb

require './my_enumerables.rb'

describe Enumerable do
  context '#my_each' do
    it 'returns the original array once it is done with the block' do
      array = [1, 2, 3]
      expect(array.my_each { |x| x * 2 }).to eql(array)
    end

    it 'returns the original range once it is done with the block' do
      range = (0..10)
      expect(range.my_each { |x| x * 2 }).to eql(range)
    end

    it 'returns the original hash once it is done with the block' do
      country_codes_hash = {
        'keniya' => 254,
        'uganda' => 256,
        'eritrea' => 291
      }
      expect(country_codes_hash.my_each { |country| "country - #{country} " }).to eql(country_codes_hash)
    end
  end

  context '#my_each_with_index' do
    it 'returns the original array once it is done with the block' do
      array = [1, 2, 3]
      expect(array.my_each_with_index { |value, index| "value - #{value} + index - #{index}" }).to eql(array)
    end

    it 'returns the original range once it is done with the block' do
      range = (0..10)
      expect(range.my_each_with_index { |value, index| "value - #{value} + index - #{index}" }).to eql(range)
    end

    it 'returns the original hash once it is done with the block' do
      country_codes_hash = {
        'keniya' => 254,
        'uganda' => 256,
        'eritrea' => 291
      }
      expect(country_codes_hash.my_each_with_index { |value, index| "value = #{value} and index = #{index}" }).to eql(country_codes_hash)
    end
  end

  context '#my_select' do
    it 'returns the sub-array of given criteria' do
      array = (1..10).to_a
      expect(array.my_select(&:even?)).to eql([2, 4, 6, 8, 10])
    end
  end

  context '#my_all?' do
    it 'returns true if all values in given array are true for a of given criteria' do
      array = (1..10).to_a
      expect(array.my_all? { |value| value < 11 }).to eql(true)
    end

    it 'checks regex and returns true if condition is met' do
      expect(%w[ant bear cat].my_all?(/a/)).to eql(true)
    end
  end

  context '#my_any?' do
    it 'returns true if one value in given array is true for a of given criteria' do
      array = (1..10).to_a
      expect(array.my_any? { |value| value == 10 }).to eql(true)
    end

    it 'checks regex and returns true if one condition is met' do
      expect(%w[ant bear cat].my_any?(/c/)).to eql(true)
    end

    it 'checks class and returns true if one element belongs to that class' do
      expect([nil, true, 99].my_any?(Numeric) ).to eql(true)
    end
    
  end

  context '#my_none?' do
    it 'returns true if no value in given array is true for a of given criteria' do
      array = (1..10)
      expect(array.my_none? { |value| value > 10 }).to eql(true)
    end

    it 'checks regex and returns true if one condition is met' do
      expect(%w[ant bear cat].my_none?(/c/)).to eql(false)
    end

    it 'checks class and returns true if no element belongs to that class' do
      expect([nil, true, 99].my_none?(Array) ).to eql(true)
    end
  end
end
