class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
# Method lookup path: [Cat, Animal, Object, Kernel, BasicObject]
cat1.color