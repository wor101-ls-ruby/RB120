# #### COMPARISON OPERATORS  #####

# class Person
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
  
#   def >(other_person)
#     age > other_person.age
#   end
# end

# # bob = Person.new("Bob", 49)
# # kim = Person.new("Kim", 33)

# # puts "bob is older than kim" if bob > kim

# ##### << SHIFT OPERATORS ########

# class Team
#   attr_accessor :name, :members

#   def initialize(name)
#     @name = name
#     @members = []
#   end

#   def <<(person)
#     members.push person
#   end
# end

# cowboys = Team.new("Dallas Cowboys")
# emmitt = Person.new("Emmitt Smith", 46)     # suppose we're using the Person class from earlier

# cowboys << emmitt                           # will this work?

# p cowboys.members                             # => [#<Person:0x007fe08c209530>]

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Temporary Team")
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end
end

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)
cowboys << Person.new("Emmitt Smith", 46)
cowboys << Person.new("Michael Irvin", 49)


niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
niners << Person.new("Jerry Rice", 52)
niners << Person.new("Deion Sanders", 47)

dream_team = cowboys + niners
dream_team.name = "Dream Team"

dream_team[4]
dream_team[5] = Person.new("JJ", 72)

puts dream_team.inspect