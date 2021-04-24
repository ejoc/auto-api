class CreateVehicleBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_brands do |t|
      t.citext :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
