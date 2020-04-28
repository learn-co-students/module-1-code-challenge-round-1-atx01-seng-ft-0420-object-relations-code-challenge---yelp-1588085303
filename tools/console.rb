require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# customers can have many reviews, restaurants can have many reviews, but a review can only have one customer and restaurant
# customers and restaurants know of each other through the review 
# Review is the single source of truth for customers and restuarants 

class Test
  @@all = []
  attr_reader :actual, :expected
  def initialize(actual, expected)
    @actual = actual
    @expected = expected
    self.assert
    @@all << self 
  end

  def assert
    message = "Test #{@@all.count}. "
    if expected == actual
      message += "Passed"
    else 
      message += raise "Expected #{expected} but got #{actual}"
    end
    puts message
  end


end


def check(actual, expected)
  Test.new(actual, expected)
end

marshall = Customer.new("Marshall", "Slemp")

texas_roadhouse = Restaurant.new("Texas Roadhouse")
new_review = Review.new(marshall, texas_roadhouse, 10)



puts "Tests for Customer"
  # checks 
check(marshall.given_name, "Marshall")
check(marshall.family_name, "Slemp")
check(marshall.full_name, "Marshall Slemp")
check(marshall.restaurants.include?(texas_roadhouse), true)
check(marshall.restaurants.count, 1)

in_n_out = Restaurant.new("In-n-Out")
marshall.add_review(in_n_out, 3.4)

check(marshall.restaurants.include?(in_n_out), true)
check(marshall.num_reviews, 2)
#  Class Tests for Customer 
check(Customer.all.include?(marshall), true)
check(Customer.find_by_name("Marshall Slemp"), marshall)
mike_jones = Customer.new("Mike", "Jones")
mike_jones.add_review(texas_roadhouse, 1.3)
check(Customer.find_by_name("Mike Jones"), mike_jones)
check(Customer.find_all_by_given_name("Mike").include?(mike_jones), true)
check(Customer.find_all_by_given_name("Marshall").include?(marshall), true)

Review.all.pop #remove mike_jones 


puts "Tests for Restaurant"
  # checks 
check(texas_roadhouse.name, "Texas Roadhouse")
check(texas_roadhouse.reviews.include?(new_review), true)
check(texas_roadhouse.reviews[0].restaurant, texas_roadhouse)
check(texas_roadhouse.customers.include?(marshall), true)
check(texas_roadhouse.customers.count, 1)

# Class Tests for Restaurant
mike_jones.add_review(texas_roadhouse, 1.3)
check(texas_roadhouse.average_star_rating, ((10 + 1.3) / 2))
Review.all.pop #remove mike_jones 



puts "Tests for Review"
  # checks
check(new_review.customer, marshall)
check(new_review.restaurant, texas_roadhouse)
check(new_review.rating, 10)
check(Review.all.include?(new_review), true)



# binding.pry
0 #leave this here to ensure binding.pry isn't the last line