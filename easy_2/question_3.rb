module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?
# What is the lookup chain for Orange and HotSauce?

puts "Orange's ancestors are: #{Orange.ancestors}"
puts ""
puts "HotSauce's ancestors are: #{HotSauce.ancestors}"
