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
  end

  def find_all 
  end
end