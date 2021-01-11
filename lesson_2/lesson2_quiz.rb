class Animal
  def speak
    "#{self.class} is the class name"
  end
end

puts Animal.new.speak