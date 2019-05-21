class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  OPERATIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval
    @stack = Array.new
    @register = 0
    @program.split.each do |token|
      if OPERATIONS.include?(token)
        send(token.downcase.to_sym) # also works without ".to_sym"
      elsif token.to_i.to_s == token
        @register = token.to_i
      else
        raise BadTokenError, "Invalid token: #{token}"
      end
    end
  rescue MinilangError => error
    puts "#{error.class}: #{error.message}"
  end

  private

  def stack_error(token)
    @stack.empty? && (token != "PUSH" && token != "PRINT")
  end

  def push
    @stack.push(@register)
  end
  
  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print
    puts @register
  end
end

Minilang.new('PRINT').eval
puts # 0
Minilang.new('5 PUSH 3 MULT PRINT').eval
puts # 15
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
puts # 5, 3, 8
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
puts # 10, 5
Minilang.new('5 PUSH POP POP PRINT').eval
puts # Empty stack!
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
puts # 6
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
puts # 12
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
puts # Invalid token: XSUB
Minilang.new('-3 PUSH 5 SUB PRINT').eval
puts # 8
Minilang.new('6 PUSH').eval
puts # (nothing printed; no PRINT commands)