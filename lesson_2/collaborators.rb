class Person
  attr_accessor :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end
end

class Cat
end

class Bulldog
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

p bob.pets