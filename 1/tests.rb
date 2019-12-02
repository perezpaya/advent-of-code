require "test/unit/assertions"
include Test::Unit::Assertions

require './main'

def expect_fuel(returned, expected)
  assert_equal compute_required_fuel_for_module(returned), expected, "required fuel should be #{expected}"
end


expect_fuel(12, 2)
expect_fuel(14, 2)
expect_fuel(1969, 654)
expect_fuel(100756, 33583)

puts 'Test suite successfully passed'
