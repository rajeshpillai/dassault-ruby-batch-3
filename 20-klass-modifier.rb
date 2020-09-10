$global_var = "I am global"
class Test
  @@count = 1   # class level variable

  # public methods
  public
  def method1
    puts "In method 1"
  end

  def method2
    puts "In method 2"
    private_method1
  end

  # Private methods does not have an explicit receiver
  private 
  def private_method1 
    puts "I am a private method 1"
  end

  def private_method2
    puts "I am a private method 2"
  end

  protected 
  def protected_method1 
    puts "I am a protected method 1"
  end
end

class UnitTest < Test

  def run 
    puts "Runnning tests...."
    protected_method1
    private_method1  # private in ruby is like protected in java
  end
end

t1 = Test.new 
t1.method1 
t1.method2
# t1.protected_method1
# t1.private_method1  # will throw error


utest = UnitTest.new 
utest.run 


