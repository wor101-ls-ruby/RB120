# class Person
#   attr_accessor :name
  
#   def ==(other)
#     name == other.name # relyhing on String#== method
#   end
# end

# bob = Person.new
# bob.name = "bob"

# bob2 = Person.new
# bob2.name = "bob"

# p bob == bob2

# str1 = "something"
# str2 = "something"

# p str1.object_id
# p str2.object_id
# p str1.equal?(str2)
# p str1 == str2

arr1 = [1,2,3]
arr2 = [1,2,3]
p arr1.object_id == arr2.object_id  # false

sym1 = :something
sym2 = :something
p sym1.object_id == sym2.object_id # true

int1 = 5
int2 = 5
p int1.object_id == int2.object_id  # true