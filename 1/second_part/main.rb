def run(list_of_modules_mass)
  list_of_modules_mass.inject(0) { |sum, l| sum + compute_total_fuel_for(l.to_i) }
end

def compute_required_fuel_for(mass)
  fuel = (mass / 3).floor - 2
  (fuel < 0) ? 0 : fuel
end

def compute_total_fuel_for(mass)
  fuel_for_mass = compute_required_fuel_for(mass)
  fuel_for_mass.zero? ? fuel_for_mass : fuel_for_mass + compute_total_fuel_for(fuel_for_mass)
end

if $0 == __FILE__
  required_fuel = run(ARGF.readlines)

  puts "The required fuel for the total modules is: #{required_fuel}"
end
