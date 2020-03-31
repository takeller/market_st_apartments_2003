class Apartment

  attr_reader :number, :monthly_rent, :bedrooms, :bathrooms, :renter
  def initialize(apartment_details)
    @number = apartment_details[:number]
    @monthly_rent = apartment_details[:monthly_rent]
    @bedrooms = apartment_details[:bedrooms]
    @bathrooms = apartment_details[:bathrooms]
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end
end
