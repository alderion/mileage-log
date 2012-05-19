class Vehicle < ActiveRecord::Base
  has_many :fill_ups
  has_many :service_items
  attr_accessible :make, :model, :name, :vin, :year

  def triggered_service_items
    service_items.where("triggered = ? and completed = ?", true, false)
  end

  def trigger_service_items new_odometer
    items = service_items.find_all_by_triggered(false)
    items.each { |item|
      if item.odometer <= new_odometer
        item.triggered = true
        item.save
      end
    }
  end

  def last_fill_ups
    fill_ups.last(10).reverse
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
