def numArgs(*args, &block)
  args.map! do |element|
    if element.instance_of?(Hash)
      element.values
    else
      element
    end
  end

  args = args.flatten.size
  block ? args + 1 : args
end

p numArgs() #== 0
p numArgs("foo") #== 1
p numArgs("foo", "bar") #== 2
p numArgs(foo: 1, bar: 2) #== 2
p numArgs() {} #== 1