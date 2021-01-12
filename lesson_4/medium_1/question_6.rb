class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# the first directly sets the instance variable when the #create_template method is called. It then uses the getter method when show_template is called
# the second utilizes the getter and setter methods created by attr_accessor when the #create_template and #show_template method are called

# both work but it is generally recommended to avoid self where it is not needed
