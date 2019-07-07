# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Executing a Proc with #call is like calling a normal method.

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# # my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# my_third_lambda.call('lambda')

# Two ways to create lambda, but they are still Proc objects.
# They have some notation to indicate it's a lambda though.
# Calling a Lambda with wrong number of args raises error,
#   unlike how a block doesn't through an ArgumentError.
# Cannot create a Lambda with `Lambda.new', Lambda is not a class.
# So Lambdas are always Proc objects.

# Group 3
# def block_method_1(animal)
#   yield(animal) if block_given?
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# You have to pass an argument to a block for it to use it.
# LocalJumpError raised if yield executed with no block.

# Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

# You can pass in more/less args to a block without an error.
# Objects/methods in scope for a block are either in the same
#   scope as the block call or passed in via argument.

# Group 5
def explicit_block(&block)
  p block
end
explicit_block { puts "something" }

def implicit_block
  yield # is the return value of the block
  # no way to inspect the block itself...
end
implicit_block { puts "something" }


# Differences:
# Blocks, Procs, and Lambdas all are executed as Proc objects.
# A block is NOT an object, while Procs and Lambdas are Proc objects.
# Blocks are converted into Proc objects when passed into a method.
# Blocks cannot be assigned to a variable.
# A lambda is a special kind of Proc that will raise an
#   ArgumentError if wrong number of args passed in (arity).
