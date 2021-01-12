class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# When objects are created they are a separate realization of a particular class.

# Given the class below, how do we create two different instances of this class with separate names and ages?

angrycat1 = AngryCat.new(14, "Boston")
angrycat2 = AngryCat.new(14, "Rocky")

angrycat1.name
angrycat2.name
