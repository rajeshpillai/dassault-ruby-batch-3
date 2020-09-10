# Opening an existing object class

class Object 
  # Overriding the class method const_missing method of the Object
  def self.const_missing(c) 
    puts "#{c} is missing.  So, let's load it dynamically."
    require_relative "./cat"
    Cat
  end
end

puffy_cat = Cat.new
puffy_cat.talk

Dog.new