class Vehicle < ApplicationRecord
  belongs_to :model, class_name: 'VehicleModel'
  validates_presence_of :year, :mileage, :price, :model
end
