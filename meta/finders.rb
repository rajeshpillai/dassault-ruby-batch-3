# Using it for pluralizing
require "active_support/inflector"

# Global variable
$db = {
  users: [
    {id:1, username:"user1"}, 
    {id:2, username:"user2"}
  ],
  tasks: [
    { id:1, title:"task 1", completed: true}, 
    { id:2,title:"task 2", completed: false}, 
    { id:3, title: "task 3", completed: true}
  ],
  projects: [
    { id: 1, title: "Project 1", owner: "rajesh"},
    { id: 2, title: "Project 2", owner: "rajesh"},
    { id: 3, title: "Project 3", owner: "urvashi"},
    { id: 4, title: "Project 4", owner: "radhika"},
  ]
}

class Model 
  def initialize 
    puts "#{self} #{class_name} is getting initialized..."
  end

  def self.connect
    p self
    # p to_s.downcase.pluralize 
    class_name = to_s.downcase.pluralize  #User => users
    # @data is a class instance variable
    @data = $db[:"#{class_name}"]
    
    # p @data
  end

  # Getter method for class instance variable 'data'
  def self.data 
    @data
  end

  # Overriding method_missing
  def self.method_missing(method, *args, &block) 
    # puts "#{method} not found. Let's dynamically create it."

    # table_name = self.to_s.downcase.pluralize 

    method_tokens = method.to_s.split("_")
    # p method_tokens

    search_field = method_tokens[2]
    if method_tokens[0] == "find"
      results = []
      self.data.each do |row|
        if row.key?(search_field.to_sym)
          if args[0] == row[search_field.to_sym]
            results << row
          end
        end
      end
      results
    else 
      super
    end
  end
end

class User < Model
  #self => User
  connect
  
end

class Task < Model
  #self => Task
  connect
end

class Project < Model 
  connect
end

# puts "User data..."
# p User.data
# puts "Project data..."
# p Project.data
# puts "Task data..."
# p Task.data


puts "Find User by id : 2"
user1 = User.find_by_id(2)
p user1

puts "Find task by id 1"
task = Task.find_by_id(1) {
  puts "Successfull found it."
}
p task 

puts "Find completed tasks"
tasks = Task.find_by_completed(true)
p tasks

puts "Find task by title 'task 1'"
tasks = Task.find_by_title("task 1")
p tasks

puts "Find project for rajesh"
projects = Project.find_by_owner("rajesh")
p projects


