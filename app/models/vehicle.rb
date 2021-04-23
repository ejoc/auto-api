class Vehicle < ApplicationRecord
  belongs_to :model, class_name: 'VehicleModel'
end
