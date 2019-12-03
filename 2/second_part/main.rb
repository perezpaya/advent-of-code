EXIT_OPCODE = 99
SUM_OPCODE = 1
PRODUCT_OPCODE = 2

EXPECTED_RESULT = 19690720

def run(program_input)
  program = program_input.split(',').map(&:to_i)

  guess_program_noun_and_value_for(program, EXPECTED_RESULT)
end

def guess_program_noun_and_value_for(program, result, range_of_values = 0..99)
  range_of_values.each do |noun|
    range_of_values.each do |value|
      output = compute_sequence(replace_program(program.clone, noun, value))

      return "#{noun.to_s.rjust(2, '0')}#{value.to_s.rjust(2, '0')}" if output[0] == result
    end
  end
end

def replace_program(program, noun, value)
  program[1] = noun
  program[2] = value
  program
end

def compute_sequence(sequence)
  sequence.each_slice(4).each_with_object(sequence) do |step, result|
    break result if step[0] == EXIT_OPCODE

    result_position = step[3]
    result[result_position] = compute_step(step, sequence)
  end
end

def compute_step(step, sequence)
  operation = operation_for(step[0])
  left_input = sequence[step[1]]
  right_input = sequence[step[2]]
  operation.call(left_input, right_input)
end

def operation_for(opcode)
  {
    1 => -> (l, r) { l + r },
    2 => -> (l, r) { l * r },
  }[opcode]
end

if $0 == __FILE__
  noun_and_value = run(ARGF.read)

  puts noun_and_value
end
