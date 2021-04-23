class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.references :model, null: false, foreign_key: { to_table: :vehicle_models }
      t.integer :year
      t.integer :mileage
      t.integer :price

      t.timestamps
    end
  end
end
