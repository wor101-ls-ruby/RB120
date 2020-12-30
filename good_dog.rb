class GoodDog
  attr_accessor :name, :height, :weight
  
  def initialize(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end
  
  def change_info(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end
  
  def info
       "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
  
  def what_is_self
    self
  end
  puts self
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self




















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