require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

bob = Customer.new("Bob", "Ross")
rick = Customer.new("Bob", "Astley")
mason = Customer.new("Mason", "Mount")

### Customer Tests
p "Customer Tests"
p bob
p bob.given_name
p bob.family_name
p bob.full_name
p Customer.all
puts

red_l = Restaurant.new("Red Lobster")
outback = Restaurant.new("Outback Steakhouse")
### Restaurant Tests
p "Restaurant Tests"
p red_l
p red_l.name
puts

red_l_bob = bob.add_review(red_l, 3)
# bob.add_review(red_l, 10)
bob.add_review(outback, 5)
rick.add_review(red_l, 4)
mason.add_review(red_l, 5)
### Review Tests
p "Review Tests"
p red_l_bob
p red_l_bob.customer
p red_l_bob.restaurant
p red_l_bob.rating
p Review.all
puts

# ### Object Relationships Tests
p "Object Relationships Tests"
puts
p "Review"
p red_l_bob.customer
p red_l_bob.restaurant
puts

p "Restaurant"
#red_l_bob.customer = rick
#red_l_bob.restaurant = outback
p red_l.reviews
p outback.reviews
p red_l.customers
p outback.customers
puts

p "Customer"
p bob.restaurants
puts

### Aggregate and Association Tests
p "Aggregate and Association Tests"

p "Customer"
p bob.reviews
p bob.num_reviews
p Customer.find_by_name("Mason Mount")
p Customer.find_all_by_given_name("Bob")
puts

p "Restaurant"
p red_l.average_star_rating
puts


0 #leave this here to ensure binding.pry isn't the last line