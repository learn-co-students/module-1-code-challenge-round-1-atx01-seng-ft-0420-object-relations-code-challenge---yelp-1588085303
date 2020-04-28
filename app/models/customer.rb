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

  def self.all
    @@all
  end

  def add_review(restaurant, rating)
    new_review = Review.new(self, restaurant, rating)
    new_review
  end

  def reviews
    rev = Review.all.select {|review| review.customer == self}
    rev.each do |review|
      if review.rating > 5
        review.rating = 5
      elsif review.rating < 1
        review.rating = 1
      else
        review.rating = review.rating
      end
    end
  end

  def restaurants
    cust_res = reviews.map {|review| review.restaurant}
    cust_res.uniq
  end

  def num_reviews
    reviews.count
  end

  def self.find_by_name(name)
    @@all.find {|customer| customer.full_name == name}
  end

  def self.find_all_by_given_name(name)
    @@all.select {|customer| customer.given_name == name}
  end
end
