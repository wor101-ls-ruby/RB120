class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end
  
  protected
  
  def a_protected_method
    "Yes, I'm protected!"
  end
end

fido = Animal.new
p fido.a_public_method


# class GoodDog
#   DOG_YEARS = 7
  
#   attr_accessor :name, :age
  
#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end
  
#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end
  
#   private
  
#   def human_years
#     age * DOG_YEARS
#   end
  

# end

# sparky = GoodDog.new("Sparky", 4)
# p sparky.public_disclosure



# class Animal
#   attr_accessor :name
  
#   def initialize(name)
#     @name = name
#   end
  
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   attr_accessor :name
  
#   def initialize(color)
#     super
#     @color = color
#   end
  
#   def speak
#     super + " Woof Woof!"
#   end
# end

# class Cat < Animal
# end

# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# bruno = GoodDog.new("brown")
# p bruno

# p BadDog.new(2, "bear")


# sparky = GoodDog.new("Sparky")
# paws = Cat.new
# puts sparky.speak
# puts paws.speak


















# class GoodDog
#   attr_accessor :name, :height, :weight
  
#   def initialize(n, h, w)
#     self.name   = n
#     self.height = h
#     self.weight = w
#   end
  
#   def change_info(n, h, w)
#     self.name   = n
#     self.height = h
#     self.weight = w
#   end
  
#   def info
#       "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end
  
#   def what_is_self
#     self
#   end
#   puts self
# end

# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# p sparky.what_is_self




















# class GoodDog
#   attr_accessor :name, :height, :weight, :age
#   @@number_of_dogs = 0
#   DOG_YEARS = 7
  
#   def initialize(n, h, w, a)
#     self.name = n
#     self.height = h
#     self.weight = w
#     self.age = a * DOG_YEARS
#     @@number_of_dogs += 1
#   end
  
  
  
#   def speak
#     "#{self.name} says arf!"
#   end
  
#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end
  
#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end
  
#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
  
#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
  
# end

# # sparky = GoodDog.new("Sparky", '12 inches', '10 lbs')        
# # puts sparky.info
# # sparky.change_info('Spartacus', '24 inches', '45 lbs')
# # puts sparky.info

# # puts GoodDog.total_number_of_dogs

# dog1 = GoodDog.new('fido', '45 inches', '45 lbs', 5)
# sparky = GoodDog.new('Sparky', '12 inches', '70lbs', 4 )

# # puts GoodDog.total_number_of_dogs
# # puts sparky.age
# # puts sparky
# # p sparky
# puts "#{sparky}"