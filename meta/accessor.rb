module AttrHelper 
  def myattr_reader(*attrs)
    attrs.each do |attr|
      self.class_eval <<-EOT
        def #{attr}; @#{attr};end
      EOT
    end
  end

  def myattr_accessor(*attrs)
    attrs.each do |attr|
      define_method(attr) {
        instance_variable_get("@#{attr}")
      }

      define_method("#{attr}=") {
        |val|
        instance_variable_set("@#{attr}", val)
      }

    end
  end
end


class User 
  extend AttrHelper 

  myattr_accessor :username, :email
  myattr_reader :id

  def initialize 
    @id = Time.new
  end
end

user = User.new 
user.username = "rajesh"

p user.username
p user.id 
