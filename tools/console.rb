require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
cameron = Customer.new("Cameron", "Rhinehardt")
imposter = Customer.new("Cameron", "Rhinehardt")
bonefish_macs = Restaurant.new("Bonefish Mac's")
musashi = Restaurant.new("Musashi")
review_1 = Review.new(cameron, bonefish_macs, 9)
review_2 = cameron.add_review(musashi, 100)
review_3 = imposter.add_review(musashi, 3)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line