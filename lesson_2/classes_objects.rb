# 1. Given the below usage of the Person class, code the class definition.
# class Person
#   attr_accessor :name
  
#   def initialize(n)
#     @name = n
#   end
  
# end

# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

# 2. odify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

# class Person
#   attr_accessor :first_name, :last_name
  
  
#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end
  
#   def name
#     [self.first_name, self.last_name].join(' ').strip
#   end
  
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# 3. Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end
  
  def name
    [self.first_name, self.last_name].join(' ').strip
  end
  
  def name=(full_name)
    parse_full_name(full_name)  
  end
  
  def to_s
    name    
  end
  
  private
  
  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''      
  end
  
end


# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# bob.first_name            # => 'John'
# bob.last_name             # => 'Adams'
# bob.name

# 4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.
# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')

# p bob.name == rob.name

# 5. Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"