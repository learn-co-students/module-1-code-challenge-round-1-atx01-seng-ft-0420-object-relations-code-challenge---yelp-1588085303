class Customer
  @@all = []

  attr_accessor :given_name, :family_name

  def initialize(given_name, family_name)
    @given_name = given_name
    @family_name  = family_name
    @@all << self
  end

  def full_name
    "#{given_name} #{family_name}"
  end

  def reviews 
    Review.all.select {|rev| rev.customer == self}
  end

  def add_review(restaurant, rating)
    Review.new(self, restaurant, rating)
  end

  def restaurants
    self.reviews.map {|rev| rev.restaurant}.uniq
  end

  def num_reviews
    self.reviews.count
  end

  def self.find_by_name(full_name)
    self.all.find {|cus| cus.full_name == full_name}
  end

  def self.find_all_by_given_name(name)
    self.all.select {|cus| cus.given_name == name}
  end

  def self.all
    @@all
  end
end
