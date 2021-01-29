module Attributes
  attr_accessor :strength, :dexterity, :constitution,
                :wisdom, :intelligence, :charisma
  

  
  def self.get_bonus(attribute)
    (attribute - 10) / 2
  end
  
  def bonus
    (self - 10) / 2
  end
  
  private
  

  
end


class Character
  include Attributes
  @@class_variable = "Test!"
  CONSTANT = "Adventurer"
  
  attr_reader :name, :level
  
  def initialize(name, level)
    @name = name
    @level = level
  end
  
  def <=>(other)
    self.level <=> other.level
  end
  
  def <(other)
    self.level < other.level ? true: false
  end
  
  def >(other)
    self.level > other.level ? true : false
  end
  
  def ==(other)
    self.<(other) == false && self.>(other) == false
  end
  
  def update_strength(new_score)
    puts " Char has str of #{strength}"
  end
  
  def self.show_class_variable
    @@class_variable
  end
  
  def self.set_class_variable=(text)
    @@class_variable = text
  end

  
end
puts Character
puts Character.show_class_variable
Character.set_class_variable=("Willow!")
puts Character.show_class_variable
puts Character::CONSTANT
morgar = Character.new("Morgar", 5)
theon = Character.new("Theon", 5)

puts morgar <=> theon
puts morgar  < theon
puts morgar > theon
puts morgar == theon