# change calc
class ChangeCalc

  # method for iterating thru the amt
  def change_calc(_price, _pay)

    price = _price.to_f
    pay = _pay.to_f

    # change hash
    change = { 'quarters' => 25, 'dimes' => 10, 'nickels' => 5, 'pennies' => 1 }

    # get difference
    diff = 0
    unless pay < price
      diff = pay - price
    else
      raise 'not enough money'
    end

    # get dollars
    dollars = diff.to_i

    # get cents
    cents = ((diff % 1) * 100).to_i

    # calculate change using coin values
    change.each do |k,v|
      # if current amt of change is enough to meet next coin type, push count of
      # that type of coin
      unless cents < v
        change[k] = (cents / v)
        cents -= v
      # else coin will be 0
      else
        change[k] = 0
      end
    end

    # prepend whole dollars into change hash
    change[:dollars] = dollars

    return change
  end
end

# item price
print "Enter item price: "
item_price = gets.chomp

# customer payment
print "Enter payment amt: "
payment = gets.chomp

calc = ChangeCalc.new
puts calc.change_calc(item_price, payment)

# tests
require 'rspec'

describe ChangeCalc do
  let(:changecalc) { ChangeCalc.new }

  it 'returns correct change' do
    # [ dollars, quarters, dimes, nickels, pennies ]
    expect(changecalc.change_calc(69.69, 80)).to eq({"quarters"=>1, "dimes"=>0, \
      "nickels"=>1, "pennies"=>1, :dollars=>10})
  end
end
