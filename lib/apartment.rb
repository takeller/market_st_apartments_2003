class Apartment

  attr_reader :number, :monthly_rent, :bedrooms, :bathrooms
  def initialize(apartment_details)
    @number = apartment_details[:number]
    @monthly_rent = apartment_details[:monthly_rent]
    @bedrooms = apartment_details[:bedrooms]
    @bathrooms = apartment_details[:bathrooms]
  end
end
