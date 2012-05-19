class ServiceItem < ActiveRecord::Base
  belongs_to :vehicle
  attr_accessible :completed, :item_desc, :odometer
end
