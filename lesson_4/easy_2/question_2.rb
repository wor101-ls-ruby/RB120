class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
p trip.predict_the_future

# As previously it will return a string of "You will " combined with a radom string from the #choices instance method
# IN this case the #choices instance method in RoadTrip will be checked by Ruby first and return one of ["visit Vegas", "fly to Fiji", "romp in Rome"] strings