require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
billy = Customer.new("Billy", "Smith")
billy2 = Customer.new("Billy", "Smith")
silly = Customer.new("Silly", "Bmith")
hilly = Customer.new("Hilly", "Smith")
shake_shack = Restaurant.new("Shake Shack")
taco_bell = Restaurant.new("Taco Bell")
review1 = Review.new(billy, shake_shack, 3)
review2 = Review.new(silly, shake_shack, 6)
review3 = Review.new(hilly, shake_shack, 1)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line