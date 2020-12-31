class Student
  attr_accessor :name
  attr_writer :grade
  
  def initialize(n, g)
    self.name = n
    self.grade = g
  end
  
  def better_grade_than?(student)
    @grade > student.grade ? true : false
  end
  
  def hi
    "#{self.name} says 'Hi!'."
  end
  
  protected
  
  def grade
    @grade
  end
  
  private
  

  
end

joe = Student.new("Joe", 95)
bob = Student.new("Bob", 97)

puts "Well done!" if joe.better_grade_than?(bob)

puts bob.hi