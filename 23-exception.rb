begin
  # Write my code
  1 / 0  # ZeroDivisionError

rescue ZeroDivisionError => e
  puts e.message 
  puts e.backtrace.inspect 
rescue exception => e 
  p e 
else
  
ensure  # finally
  puts "This code will always run"
end
  