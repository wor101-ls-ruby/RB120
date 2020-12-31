module Towing

  def is_towable?(weight)
    weight < 2000 ? true : false
  end
  
  def current_load
    @current_load 
  end
  
  def change_load(weight)
    @current_load = weight
  end
  
end



class Vehicle
  attr_accessor :year, :color, :model, :speed
  @@number_of_vehicles = 0
  
  def initialize(y, c, m)
    self.year = y
    self.color = c
    self.model = m
    self.speed = 0
    @@number_of_vehicles += 1
  end
  
  def self.number_of_vehicles
    @@number_of_vehicles
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
  
  def spray_paint(color)
    self.color = color
  end
  
  def to_s
    "This is a #{year} #{color} #{model}."
  end
  
  def age
    "This #{self.model} is #{calculate_age} years old."
  end
  
  private
  
  def calculate_age
    current_year = Time.new.year
    current_age = current_year - self.year.to_i
    
  end
  
end

class MyCar < Vehicle
  attr_reader :doors
  TRUNK = true

  def initialize(y, c, m, d)
    super(y, c, m)
    @doors = d
  end
  
  def to_s
    "This is a #{doors.to_s} door #{year} #{color} #{model}."
  end

end

class MyTruck < Vehicle
  include Towing
  TRUCK_BED = true
  
  def initialize(y, c, m)
    super(y, c, m)
  end

end

Vehicle.number_of_vehicles

new_car = MyCar.new('1997', 'black', 'camry', 4)
new_car.to_s

new_truck = MyTruck.new('2010', 'red', 'F-1')
new_truck.to_s

Vehicle.number_of_vehicles

new_truck.current_load
new_truck.change_load(1250)
new_truck.current_load
second_truck = MyTruck.new('2020', 'blue', 'F-1')
second_truck.current_load

# puts "---MyTruck method lookup---"
# puts MyTruck.ancestors
# puts ""
# puts"---MyCar method lookup---"
# puts MyCar.ancestors

# puts new_truck.color
# new_truck.spray_paint('green')
# puts new_truck.color
# puts new_car.color
# new_car.spray_paint("yellow")
# puts new_car.color

puts new_car.age
puts new_truck.age
puts second_truck.age