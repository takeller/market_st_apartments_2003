class Apartment

  def initialize(apartment_details)
    @number = apartment_details[:number]
    @monthly_rent = apartment_details[:monthly_rent]
    @bedrooms = apartment_details[:bedrooms]
    @bathrooms = apartment_details[:bathrooms]
  end
end
