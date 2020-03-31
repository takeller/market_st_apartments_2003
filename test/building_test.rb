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
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    @renter1 = Renter.new("Aurora")
    @renter2 = Renter.new("Tim")
    @renter3 = Renter.new("Max")
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

  def test_it_has_renters_if_units_have_a_renter
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    @unit1.add_renter(@renter1)
    @unit2.add_renter(@renter2)

    assert_equal ["Aurora", "Tim"], @building.renters
  end

  def test_average_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    assert_equal 1099.5, @building.average_rent
  end

  def test_rented_units
    assert_equal [], @building.rented_units

    @unit2.add_renter(renter2)

    assert_equal [@unit2], @building.rented_units
  end
end
