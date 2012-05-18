class Vehicle < ActiveRecord::Base
  has_many :fill_ups
  attr_accessible :make, :model, :name, :vin, :year

  def last_fill_ups
    fill_ups.last 5
  end

  def ave_mpg
    n = 0
    t = 0.0
    last_fill_ups.each { |fup|
      n += 1
      t += fup.mpg
    }
    sprintf("%.2f", t / n)
  end

  def get_last_cost_per_gallon
    if get_last_fill_up
      return get_last_fill_up.cost_per_gallon
    end
    return 0
  end

  def get_last_odometer
    if get_last_fill_up
      return get_last_fill_up.odometer
    end
    return 0
  end

  def get_second_to_last_odometer
    logger.debug("fups: #{fill_ups.inspect}")
    if get_second_to_last_fill_up
      return get_second_to_last_fill_up.odometer
    end
    return 0
  end

  def get_last_fill_up
    fill_ups.last
  end

  def get_second_to_last_fill_up
    fill_ups[fill_ups.length - 2]
  end
end
