class BeesWax
  attr_accessor :type
  
  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"   #get rid of the @ before type. It is standard practive to use the method if a getter method exists for an instance variable
  end
end

# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

