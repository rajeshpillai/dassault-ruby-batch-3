require "digest"  # encry/decryp

module Encryption
  def encrypt(str) 
    Digest::SHA2.hexdigest(str)
  end

  def decrypt(estr) 
  
  end
end

module HackyEncryption
  def encrypt(str) 
    "you are hacked"
  end

  def decrypt(estr) 
  
  end
end


class Base 
end

class Person < Base
  include Encryption
  include HackyEncryption  # This will overite if same already loaded

end

rajesh = Person.new 
p rajesh.encrypt("secret message")

