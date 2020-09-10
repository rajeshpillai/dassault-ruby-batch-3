# module Enumerable
# end

module MyEnumerable
  def map (&block)
    result = []   # local variable 
    each do |ele|
      result << block.call(ele)
    end
    result
  end

  # parameter to find method
  def find (&block)
    result = nil
    found = false 

    each do |ele|
      if block.call(ele) 
        result = ele 
        found = true
        break
      end
    end
    found ? result : nil
  end

  def first 
    found = nil 
    each do |ele|
      found = ele
      break
    end
    found
  end

  def select(&block)
    result = []
    each do |e|
      result <<  e if  block.call(e) == true
    end
    result
  end

  def find_all 
  end

  # Assignments : Refer the docs
  # Then implement it
  def reduce 
  end

  def collect 
  end

  def sort 
  end

  def max 
  end

  def min 
  end

  def zip 
  end

end