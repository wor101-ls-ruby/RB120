#### QUESTION 2
# If we have a Car class and a Truck class and we want to be able to go_fast, 
# how can we add the ability for them to go_fast using the module Speed? 
# How can you check if your Car or Truck can now go fast?

# module Speed
#   def go_fast
#     self.fast = true
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
  
#   attr_accessor :fast
  
#   def initialize
#     @fast = nil
#   end
  
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed
  
#   attr_accessor :fast
  
#   def initialize
#     @fast = nil
#   end
  
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# car = Car.new
# car.go_fast

# truck = Truck.new
# truck.go_fast


######Question 4########
# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# angry_cat = AngryCat.new
# angry_cat.hiss


######Question 5#######
# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# hot_pizza = Pizza.new("cheese")
# orange = Fruit.new("apple")
# p hot_pizza.instance_variables
# p orange.instance_variables


####QUESTION 6########
# What could we add to the class below to access the instance variable @volume?

class Cube
  # attr_accessor :volume
  def initialize(volume)
    @volume = volume
  end
  
  def get_volume
    @volume
  end
end

big_cube = Cube.new(5000)
p big_cube.instance_variable_get("@volume")
p big_cube.get_volume