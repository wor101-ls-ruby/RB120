#Class based inheritance works great when it's used to model hierarchical domains. 
# Let's take a look at a few practice problems. 
# Suppose we're building a software system for a pet hotel business, so our classes deal with pets.

# 1. Given this class:

class Pet
  def run
    'running!'
  end
  
  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
  
  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    "Meow!"
  end
end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. 
#For example, bulldogs can't swim, but all other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

# karl = Bulldog.new
# puts karl.speak
# puts karl.swim

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p pete.run                # => "running!"
# p pete.speak              # => NoMethodError

p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
# p kitty.fetch             # => NoMethodError

p dave.speak              # => "bark!"

p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"

# 3. Draw a class hiearchy diagram of the classes from step #2
# Pet --> Dog --> Bulldog
#     --> Cat

#4. What is the method lookup path and how is it important?
The method lookup path is the order in which Ruby looks for the method being invoked. 
It starts by looking in the class it is being called. Next it checks for included modules with the last added module searched first.
Then it checks the parent class. Then the object, kernel, basicobject