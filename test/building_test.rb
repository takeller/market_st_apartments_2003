require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter.rb'
require './lib/apartment.rb'
require './lib/building.rb'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @renter1 = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_no_units_by_default
    assert_equal [], @building.units
  end

  def test_it_has_no_renters_by_default
    assert_equal [], @building.renters
  end

  def test_add_unit
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    assert_equal [@unit1, @unit2], @building.units
  end
end
