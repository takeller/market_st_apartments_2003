class Building

  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
      rented_units = @units.find_all { |unit| unit.renter }
      rented_units.map { |unit| unit.renter.name  }
  end

  def average_rent
    unit_rents = @units.map { |unit| unit.monthly_rent }
    unit_rents.sum/(@units.length).to_f
  end

  def rented_units
    @units.find_all { |unit| unit.renter }
  end

  def renter_with_highest_rent
    rented_units.max_by { |unit| unit.monthly_rent}.renter
  end

  def units_by_number_of_bedrooms
    units_by_bedroom = @units.group_by { |unit| unit.bedrooms }
    units_by_bedroom.transform_values do |unit|
       unit.map { |unit| unit.number  }
     end
  end

  def annual_breakdown
    breakdown = renters.map do |renter|
      renters_unit = rented_units.find { |unit| unit.renter.name == renter}
      [renter, (renters_unit.monthly_rent) * 12]
    end
    breakdown.to_h
  end

  def rooms_by_renter
    rooms_by_renter = renters.map do |renter|
      renters_unit = rented_units.find { |unit| unit.renter.name == renter}
      [renters_unit.renter, {bathrooms: renters_unit.bathrooms, bedrooms: renters_unit.bedrooms}]
    end
    rooms_by_renter.to_h
  end

end
