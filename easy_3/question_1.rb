class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:
# case 1:
hello = Hello.new
hello.hi
# puts "Hello"

# case 2:
# hello = Hello.new
# hello.bye
# throws an undefined method error

# case 3:
# hello = Hello.new
# hello.greet
# throws an arror saying 1 argument expected and 0 arguments given

# case 4:
hello = Hello.new
hello.greet("Goodbye")
# puts "Goodbye"

# case 5:
Hello.hi
# throws undefined error method as there is no #hi class method. It is an instance method