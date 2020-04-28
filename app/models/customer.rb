require "pry"

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
    Review.all.reduce([]) do |memo, review| 
      if review.customer == self && !memo.include?(review.restaurant)
        memo << review.restaurant
      end  
      memo
    end
  end

  def add_review(restaurant, rating)
    Review.new(self, restaurant, rating)
  end

  def num_reviews
    Review.all.select {|review| review.customer == self}.count
  end

  def self.find_by_name(name)
    Review.all.find{|review| review.customer.full_name == name }.customer
  end

  def self.find_all_by_given_name(name)
    Review.all.reduce([]) do |memo, review|
      if review.customer.given_name == name
        memo << review.customer 
      end
      memo
    end
  end
  
  def self.all
    @@all
  end

end
