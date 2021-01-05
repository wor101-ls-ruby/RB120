# class Animal
#   def eat
#     # generic eat method
#   end
# end

# class Fish < Animal
#   def eat
#     # eating specific to fish
#   end
# end

# class Cat < Animal
#   def eat
#     # eat implementation for cat
#   end
# end

# def feed_animal(animal)
#   animal.eat
# end

# array_of_animals = [Animal.new, Fish.new, Cat.new]
# array_of_animals.each do |animal|
#   feed_animal(animal)
# end

class Dog
  attr_reader :nickname
  
  def initialize(n)
    @nickname = n
  end
  
  def change_nickname(n)
    self.nickname = n
  end
  
  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end
  
  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny")
puts dog.greeting