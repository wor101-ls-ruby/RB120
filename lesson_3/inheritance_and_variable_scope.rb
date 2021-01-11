# class Animal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Animal
#   def dog_name
#     "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
#   end
# end

# teddy = Dog.new("Teddy")
# puts teddy.dog_name                       # => bark! bark! Teddy bark! bark!

##MODULES##

# module Swim
#   def enable_swimming
#     @can_swim = true
#   end
# end

# class Dog
#   include Swim

#   def swim
#     "swimming!" if @can_swim
#   end
# end

# teddy = Dog.new
# p teddy.swim                                  # => nil
# teddy.enable_swimming
# p teddy.swim

#####CLASS VARIABLES######

# class Animal
#   @@total_animals = 0

#   def initialize
#     @@total_animals += 1
#   end
# end

# class Dog < Animal
#   def total_animals
#     @@total_animals
#   end
# end

# spike = Dog.new
# p spike.total_animals                           # => 1

######CONSTANTS#############

class Dog
  LEGS = 4
end

class Cat
  def legs
    Dog::LEGS
  end
end

kitty = Cat.new
p kitty.legs                                  # => NameError: uninitialized constant Cat::LEGS