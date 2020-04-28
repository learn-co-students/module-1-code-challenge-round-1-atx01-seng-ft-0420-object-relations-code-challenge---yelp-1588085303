class Customer
  attr_accessor :given_name, :family_name

  @@all = []

  def initialize(given_name, family_name)
    @given_name = given_name
    @family_name  = family_name
    @@all << self
  end

  def full_name
    "#{given_name} #{family_name}"
  end

  def restaurants
    reviews = Review.all.select { |review| review.customer == self}
    reviews.map { |reviews| reviews.restaurant }.uniq
  end

  def add_review(restaurant, rating)
    Review.new(self, restaurant, rating)
  end

  def num_reviews
    Review.all.select { |review| review.customer == self}.count
  end

  def self.find_by_name(name)
    @@all.find { |names| names.full_name == name}
  end

  def self.find_all_by_given_name(name)
    @@all.select { |names| names.given_name == name}
  end
  
end
