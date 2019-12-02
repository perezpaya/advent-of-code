def compute_required_fuel_for_module(mass)
  (mass / 3).floor - 2
end

if $0 == __FILE__
  required_fuel = ARGF.readlines.inject(0) { |sum, l| sum + compute_required_fuel_for_module(l.to_i) }

  puts "The required fuel for the total modules is: #{required_fuel}"
end
