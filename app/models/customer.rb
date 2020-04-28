class Customer
  attr_accessor :given_name, :family_name
  attr_reader :restaurants
  @@all = []

  def initialize(given_name, family_name)
    @given_name = given_name
    @family_name  = family_name
    @restaurants = []
    @@all<<self
  end

  def full_name
    "#{given_name} #{family_name}"
  end

  def self.all
    @@all
  end

  def add_review(restaurant, rating)
    new_review = Review.new(self, restaurant, rating)
    @restaurants << restaurant
  end

  def num_reviews
    @restaurants.count
  end

  def self.find_by_name(name)
    @@all.each do |n|
      if n.full_name == name
        return n
      end
    end
    return "There is no one with that name here!"
  end

  def self.find_all_by_given(name)
    @@all.select { |n| n.full_name == name }
  end

end
