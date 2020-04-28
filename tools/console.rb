require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

mustard = Restaurant.new("Mustard Mike's")
ribman = Restaurant.new("Ribman's")
pete = Customer.new("Pete", "Zapaya")
regina = Customer.new("Regina", "Phalange")
mantis = Customer.new("Mantis", "Toboggan")
review_one = Review.new(mantis, mustard, 5)
review_two = Review.new(pete, mustard, 4)
review_three = Review.new(pete, mustard, 3)
review_four = Review.new(pete, ribman, 2)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line