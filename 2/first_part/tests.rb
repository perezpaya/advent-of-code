require "test/unit/assertions"
include Test::Unit::Assertions

require './main'

def expect_result(program_seq, expected_output_seq)
  assert_equal compute_sequence(program_seq.split(',').map(&:to_i)).join(','),
    expected_output_seq,
    "expected output should be #{expected_output_seq}"
end

expect_result('1,0,0,0,99', '2,0,0,0,99')
expect_result('2,3,0,3,99', '2,3,0,6,99')
expect_result('2,4,4,5,99,0', '2,4,4,5,99,9801')
expect_result('1,1,1,4,99,5,6,0,99', '30,1,1,4,2,5,6,0,99')
expect_result('1,9,10,3,2,3,11,0,99,30,40,50', '3500,9,10,70,2,3,11,0,99,30,40,50')

puts 'Test suite successfully passed'
