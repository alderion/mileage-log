class FillUp < ActiveRecord::Base
  belongs_to :vehicle
  attr_accessible :cost_per_gallon, :fill_date, :gallons, :odometer

  def mpg_str
    sprintf("%.2f", mpg)
  end

  def total_cost
    cost_per_gallon * gallons
  end
end
