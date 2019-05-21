module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new
# betty.name = "Betty"
# betty.address = "937 Cypress Creek Dr."
# betty.city = "Plano"
# betty.state = "TX"
# betty.state = "75025"
bob = Employee.new
# bob.name = "Bob"
# bob.address = "432 Inwood Rd."
# bob.city = "Azle"
# bob.state = "TX"
# bob.state = "76020"
betty.print_address
bob.print_address