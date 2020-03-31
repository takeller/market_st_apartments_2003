require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter.rb'
require './lib/apartment.rb'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @renter1 = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Building, @building 
  end
end
