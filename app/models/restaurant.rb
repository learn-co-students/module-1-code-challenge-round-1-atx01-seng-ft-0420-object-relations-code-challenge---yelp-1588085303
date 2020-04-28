class Restaurant
  attr_reader :name

  def initialize(name)
    @name = name
  end 

  def reviews
    rev = Review.all.select {|review| review.restaurant == self}
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

  def customers
    ppl = reviews.map {|review| review.customer}
    ppl.uniq
  end

  def average_star_rating
    ratings = reviews.map {|review| review.rating}
    average_rating = ratings.sum / ratings.count
    average_rating
  end

end
