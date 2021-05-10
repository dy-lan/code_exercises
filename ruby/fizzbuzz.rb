# fizzbuzz
class FizzBuzz
  # method to determine fizzbuzz
  def fizzbuzz(num)
    return_str = ''
    return_str += 'fizz' if (num % 3).zero?
    return_str += 'buzz' if (num % 5).zero?
    return_str.empty? ? num : return_str
  end
end

# instantiate fizzbuzz object
fb_object = FizzBuzz.new

# test the method works on numbers 1 thru 100
(1..100).each do |i|
  puts fb_object.fizzbuzz(i)
end

# tests
require 'rspec'

describe FizzBuzz do
  let(:fizz_buzz) { FizzBuzz.new }

  it 'prints fizz when 3' do
    expect(fizz_buzz.fizzbuzz(3)).to eq('fizz')
  end

  it 'prints buzz when 5' do
    expect(fizz_buzz.fizzbuzz(5)).to eq('buzz')
  end

  it 'prints fizzbuzz when 3 and 5' do
    expect(fizz_buzz.fizzbuzz(15)).to eq('fizzbuzz')
  end

  it 'prints number when neither 3 nor 5' do
    expect(fizz_buzz.fizzbuzz(1)).to eq(1)
  end
end
