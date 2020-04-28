class Restaurant
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def reviews
    Review.all.select { |review| review.restaurant == self}
  end

  def customers
    reviews.map { |reviews| reviews.customer}.uniq
  end

  def average_star_rating
    total_star = 0
    reviews.each { |rest_reviews| total_star += rest_reviews.rating}
    total_star / reviews.count
  end
  
end
