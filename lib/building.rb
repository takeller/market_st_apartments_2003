class Building

  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
      @units.map { |unit| unit.renter.name }
  end

  def average_rent
    unit_rents = @units.map { |unit| unit.monthly_rent }
    unit_rents.sum/(@units.length).to_f
  end
end
