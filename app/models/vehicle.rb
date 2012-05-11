class Vehicle < ActiveRecord::Base
  attr_accessible :make, :model, :name, :vin, :year
end
