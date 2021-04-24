class VehicleModel < ApplicationRecord
  belongs_to :brand, class_name: 'VehicleBrand'
  accepts_nested_attributes_for :brand
  validates :brand, :name, :presence => true
  validates :name, uniqueness: {case_sensitive: false}

end
