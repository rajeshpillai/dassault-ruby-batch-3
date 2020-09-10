# Opening an existing object class

# Opening the Object class
class Object 
  # Overriding the class method const_missing method of the Object
  def self.const_missing(const_name) 
    puts "#{const_name} is missing.  So, let's load it dynamically."
    require_relative "./#{const_name.downcase}"
    # Cat
    klass = const_get(const_name)
    return klass  if klass 
  end
end

puffy_cat = Cat.new
puffy_cat.talk


