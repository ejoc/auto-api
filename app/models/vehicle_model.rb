class VehicleModel < ApplicationRecord
  belongs_to :brand, class_name: 'VehicleBrand'
  
  accepts_nested_attributes_for :brand
  validates_presence_of :brand
  
  # validates :name, presence: true
  validates :name, uniqueness: true

end
