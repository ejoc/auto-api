class CreateVehicleModels < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_models do |t|
      t.citext :name, null: false, index: { unique: true }
      t.references :brand, null: false, foreign_key: { to_table: :vehicle_brands }

      t.timestamps
    end
  end
end
