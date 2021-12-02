require "test/unit/assertions"
include Test::Unit::Assertions

require './main'

def expect_fuel(returned, expected)
  assert_equal compute_total_fuel_for(returned), expected, "required fuel should be #{expected}"
end

expect_fuel(14, 2)
expect_fuel(1969, 966)
expect_fuel(100756, 50346)

puts 'Test suite successfully passed'
