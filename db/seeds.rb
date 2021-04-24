# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["VW", "Chevrolet", "Nissan"].each do |name|
  VehicleBrand.create(name: name)
end

# VehicleModels
brand = VehicleBrand.find_by(name: "VW")
[
  {
    brand: brand,
    name: "JETTA",
  },
  {
    brand: brand,
    name: "POLLO",
  },
  {
    brand: brand,
    name: "GOLF",
  },
  {
    brand: brand,
    name: "UP",
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end

brand = VehicleBrand.find_by(name: "Chevrolet")
[
  {
    brand: brand,
    name: "TRAILBLAZER",
  },
  {
    brand: brand,
    name: "SONIC",
  },
  {
    brand: brand,
    name: "BOLT",
  },
  {
    brand: brand,
    name: "BLAZER",
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end
brand = VehicleBrand.find_by(name: "Nissan")
[
  {
    brand: brand,
    name: "KICKS",
  },
  {
    brand: brand,
    name: "SENTRA",
  },
  {
    brand: brand,
    name: "VERSA",
  },
  {
    brand: brand,
    name: "MURANO",
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end