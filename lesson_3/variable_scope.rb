# class Person
#   def initialize(n)
#     @name = n
#   end
# end

# bob = Person.new('bob')
# joe = Person.new('joe')

# puts bob.inspect
# puts joe.inspect

class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']
  
  attr_reader :name
  
  def self.titles
    TITLES.join(', ')
  end
  
  def initialize(n)
    @name = "#{TITLES.sample} #{n}"
  end
end

p Person.titles

bob = Person.new('bob')
p bob.name