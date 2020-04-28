class Review
    attr_accessor :rating
    attr_reader :customer, :restaurant
     
    @@all=[] 

    def initialize (rating,customer,restaurant)
        @rating = rating
        @customer = customer
        @restaurant = restaurant

        @@all << self
    end
    def name
        customer.name
    end

    def self.all
        @@all
      end
  
end