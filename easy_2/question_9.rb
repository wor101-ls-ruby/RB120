class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
  
  def play
    "Time to play Bingo!"
  end
  
end

# What would happen if we added a play method to the Bingo class, 
# keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# it would take precedence over the #play method from Game as Ruby first will look into the objects class before looking into its super-class

bingo = Bingo.new
puts bingo.play