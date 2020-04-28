class Restaurant
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def reviews
    Review.all.select do |review| review.restaurant == self end 
  end

  def customers
    our_customers = reviews.map do |review| review.customer end
    our_customers.uniq
  end

  def average_star_rating
    restaurant_reviews = reviews 
    rating_total = restaurant_reviews.reduce(0) do |memo, review| memo + review.rating end
    rating_average = rating_total / restaurant_reviews.count
  end

end
