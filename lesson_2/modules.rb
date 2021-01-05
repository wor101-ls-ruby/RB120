module Swim
  def swim
    "swimming!"
  end
end

class Dog
  include Swim
end

class Fish
  include Swim
end