QUESTION 1
  Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?
  
  true
  "hello"
  [1, 2, 3, "happy days"]
  142
  
  - All are objects
  - calling the #class method on the object
  - 

QUESTION 3
# In the last question we had a module called Speed which contained a go_fast method. 
# We included this module in the Car class as shown below.

# When we called the go_fast method from an instance of the Car class (as shown below) 
# you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. 
# How is this done?


module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

 -  we use self which references the current object and call the #class method on it to return the class name



QUESTION 5
Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

  - the Pizza class has an instance variable because @name starts with an @ symbol
  - the name variable in Fruit is a local variable because it does not start with @
  - can check by calling #intance_variables on the objects. it will return an array of instance variables
  - 
  
QUESTION 7
What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

  - by default #to_s returns the name of the object's class and an encoding of the object id
  - 
QUESTION 8
You can see in the make_one_year_older method we have used self. What does self refer to here?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

  - self refers to the current instance of the cat object
  - 

QUETSION 9
In the name of the cats_count method we have used self. What does self refer to in this context?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

  - self refers to the Class itself and NOT an instance of the class
  - 
QUETION 10
If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

bag = Bag.new('brown', 'paper')

