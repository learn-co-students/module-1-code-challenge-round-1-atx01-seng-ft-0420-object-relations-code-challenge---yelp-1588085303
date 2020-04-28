class Review
    attr_accessor :rating
    attr_reader :customer, :restaurant
    @@all = []

    def initialize(customer, restaurant, rating)
        customer.restaurants<<restaurant
        restaurant.reviews<<self
        @customer = customer
        @restaurant =restaurant
        @rating = rating
        @@all<<self
    end

    def self.all
        @@all
    end

end