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

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# the @@cats_counts variable is a class variable and is accessible by every instance of the class
# in this case it is incremented by 1 every time a new object of the Cat class is initialized
# we can use the class method #cats_count to access the value of the class variable

cat1 = Cat.new("brown")
puts Cat.cats_count
cat2 = Cat.new("white")
puts Cat.cats_count