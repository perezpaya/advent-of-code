EXIT_OPCODE = 99
SUM_OPCODE = 1
PRODUCT_OPCODE = 2

def run(program)
  compute_sequence(restore_program_state_before_fire(program))
end

def restore_program_state_before_fire(program)
  restored_program = program.split(',').map(&:to_i)
  restored_program[1] = 12
  restored_program[2] = 2
  restored_program
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
  result_sequence = run(ARGF.read)
  result_value = result_sequence[0]

  puts result_value
end
