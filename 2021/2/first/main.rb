def resolve_task(lines)
  lines
    .map { |l| l.split(" ") }
    .each_with_object({x: 0, y: 0}) do |(direction, value), result|
      case direction.to_sym
      when :forward
        result[:x] += value.to_i
      when :up
        result[:y] += value.to_i
      when :down
        result[:y] -= value.to_i
      end
    end.values.inject(:*).abs
end

if __FILE__==$0
  puts resolve_task(IO.readlines('./input'))
end