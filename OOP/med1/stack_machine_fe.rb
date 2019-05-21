# Further Exploration:
# Add functionality for calculating specific problems.

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  OPERATIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval(*args)
    @program = format(@program, *args)
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
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def print
    puts @register
  end
end

MILES_TO_KILOMETERS = "3 PUSH %<miles>d DIV PUSH 5 MULT PRINT"
minilang = Minilang.new(MILES_TO_KILOMETERS)
minilang.eval(miles: 15)

AREA_OF_RECTANGLE = "%<width>d PUSH %<height>d MULT PRINT"
minilang = Minilang.new(AREA_OF_RECTANGLE)
minilang.eval(width: 5, height: 10)