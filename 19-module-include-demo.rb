require_relative './modules/digest'

class Base 
end

class Person < Base
  include Encryption
  include HackyEncryption  # This will overite if same already loaded

end

rajesh = Person.new 
p rajesh.encrypt("secret message")

