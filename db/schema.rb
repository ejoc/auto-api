# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_23_040850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "vehicle_brands", force: :cascade do |t|
    t.citext "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_vehicle_brands_on_name", unique: true
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.citext "name", null: false
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_vehicle_models_on_brand_id"
    t.index ["name"], name: "index_vehicle_models_on_name", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "model_id", null: false
    t.integer "year"
    t.integer "mileage"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model_id"], name: "index_vehicles_on_model_id"
  end

  add_foreign_key "vehicle_models", "vehicle_brands", column: "brand_id"
  add_foreign_key "vehicles", "vehicle_models", column: "model_id"
end
