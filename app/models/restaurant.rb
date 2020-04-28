class Restaurant
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def reviews
    Review.all.select {|rev| rev.restaurant == self}
  end 

  def customers
    self.reviews.map {|rev| rev.customer}.uniq
  end

  def average_star_rating
    (self.reviews.map {|rev| rev.rating}.reduce(:+).to_f / self.reviews.count.to_f).round(1)
  end
end
 