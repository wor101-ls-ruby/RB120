# Create a class called MyCar. 
# When you initialize a new instance or object of the class, allow the user to define some instance variables 
# that tell us the year, color, and model of the car. 
# Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. 
# Create instance methods that allow the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :color, :speed 
  attr_reader :year, :model
  
  def initialize(y, c, m)
    @year = y 
    @color = c
    @model = m
    @speed = 0
  end
  
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def spray_paint(new_color)
    self.color = new_color
  end
  
  
  def accelerate
    self.speed += 5
  end
  
  def decelerate
    self.speed -= 5
  end
  
  def shut_off
    self.speed = 0
  end
  
  def to_s
    "This car is a #{color.downcase} #{year} #{model}"
  end
  
end

new_car = MyCar.new('1997', 'Black', 'Camry')

# puts new_car.year
# puts new_car.color
# puts new_car.model
# puts new_car.speed
new_car.accelerate
# puts new_car.speed
new_car.shut_off
# puts new_car.speed
new_car.spray_paint("Blue")
# puts new_car.color
MyCar.gas_mileage(13, 351)
puts new_car.to_s