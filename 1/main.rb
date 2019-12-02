def run(list_of_modules_mass)
  list_of_modules_mass.inject(0) { |sum, l| sum + compute_required_fuel_for_module(l.to_i) }
end

def compute_required_fuel_for_module(mass)
  (mass / 3).floor - 2
end

if $0 == __FILE__
  required_fuel = run(ARGF.readlines)

  puts "The required fuel for the total modules is: #{required_fuel}"
end
