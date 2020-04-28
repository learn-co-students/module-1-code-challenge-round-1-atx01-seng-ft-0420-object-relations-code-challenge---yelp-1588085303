class Restaurant
  attr_reader :name, :reviews

  def initialize(name)
    @name = name
    @customers = []
    @reviews = []
  end

  def customers
    @reviews.map{|n| n.customer}.uniq
  end

  def average_star_rating
    avg = 0

    @reviews.each do |n|
      avg += n.rating
    end
    return avg / @reviews.length
  end

end
