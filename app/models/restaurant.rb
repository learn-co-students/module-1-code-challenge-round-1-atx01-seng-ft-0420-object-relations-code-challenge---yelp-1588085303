class Restaurant
  attr_reader :name, :review, :customer
  @@all=[]

  def initialize(name)
    @name = name
    @review = review
    @customer = customer

    @@all << self
  end

  def place_name
    p "#{name}"
  end

  def self.restaurant_reviews
    self.all.map{|Restaurant| Restaurant.review}
  end

  def sel.restaurant_customer
    self.all.uniq{|Restaurant| Restaurant.customer}

  def self.all
    @@all
  end

end
