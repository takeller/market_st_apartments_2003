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
end
