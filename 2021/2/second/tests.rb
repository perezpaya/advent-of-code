require "test/unit/assertions"
include Test::Unit::Assertions

require './main'

def assert_task(input, expected)
  assert_equal resolve_task(input.each_line), expected
end

input = <<~INPUT
forward 5
down 5
forward 8
up 3
down 8
forward 2
INPUT

assert_task(input, 900)

puts 'Test suite successfully passed'
