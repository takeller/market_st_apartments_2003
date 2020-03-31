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

    assert_equal ["Aurora"], @building.renters

    @unit2.add_renter(@renter2)

    assert_equal ["Aurora", "Tim"], @building.renters
  end

  def test_average_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)

    assert_equal 1099.5, @building.average_rent
  end

  def test_rented_units
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    assert_equal [], @building.rented_units

    @unit2.add_renter(@renter2)
    @unit3.add_renter(@renter3)

    assert_equal [@unit2, @unit3], @building.rented_units
  end

  def test_renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter2)

    assert_equal @renter2, @building.renter_with_highest_rent

    @unit1.add_renter(@renter1)

    assert_equal @renter1, @building.renter_with_highest_rent

    @unit3.add_renter(@renter3)

    assert_equal @renter1, @building.renter_with_highest_rent

  end

  def test_units_by_number_of_bedrooms
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @building.add_unit(@unit4)

    expected = { 3 => ["D4"], 2 => ["B2", "C3"], 1=> ["A1"]}
    assert_equal expected, @building.units_by_number_of_bedrooms
  end

  def test_annual_breakdown
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)

    @unit2.add_renter(@renter2)
    expected = { "Tim" => 11988 }
    assert_equal expected, @building.annual_breakdown

    @unit3.add_renter(@renter3)

    expected = {"Tim" => 11988, "Max" => 13800}
    assert_equal expected, @building.annual_breakdown
  end
end
