
# In map if the only operation in the block is method call
# the shortcut &:method_name can be passed to the block

cities = ["mumbai", "DELHI", "cHENNai", "KERaLa"]

lcities = cities.map do |city|
  city.downcase
end


lcities2 = cities.map(&:downcase)


p lcities
p lcities2


