# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack.
  # Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register 
  # value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the 
  # register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the 
  # register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register 
  # value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register 
  # value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# OPERATIONS = ["PUSH", "ADD", "SUB", "MULT", "DIV", "MOD", "POP", "PRINT"]

def stack_machine(command)
  commands = command.split
  stack = []
  register = 0

  commands.each do |item|
    case item
    when "PUSH"  then stack << register.to_i
    when "ADD"   then register += stack.pop
    when "SUB"   then register -= stack.pop
    when "MULT"  then register *= stack.pop
    when "DIV"   then register /= stack.pop
    when "MOD"   then register %= stack.pop
    when "POP"   then register = stack.pop
    when "PRINT" then puts register
    else         register = item.to_i
    end
  end

  puts "\n"
end

stack_machine('PRINT') # 0
stack_machine('5 PUSH 3 MULT PRINT') # 15
stack_machine('5 PRINT PUSH 3 PRINT ADD PRINT') # 5, 3, 8
stack_machine('5 PUSH POP PRINT') # 5
stack_machine('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') # 5, 10, 4, 7
stack_machine('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
stack_machine('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
stack_machine('-3 PUSH 5 SUB PRINT') # 8
stack_machine('6 PUSH') # (nothing printed; no PRINT commands)

# (3 + (4 * 5) - 7) / (5 % 3)
# stack_machine("3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT")
