# Hash
family = {
  sisters: ["s1","s2","s3"],
  brothers: ["b1","b2","b3"],
  uncles: ["u1","u2","u3"],
  aunts: ["a1","a2","a3"]
}

# Nearest family members
# reduce -> or it's alias 'inject'
near_members = family.reduce([]) do |arr, (k,v)|
  p arr
  p k, v
  if (k == :sisters || k == :brothers)
    arr << v
  end
  arr
end

p near_members.flatten

# def reduce (initial, &block)
#   block.call(initialize, {a, b})
# end


