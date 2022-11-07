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

ActiveRecord::Schema[7.0].define(version: 2022_11_07_173917) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.float "price"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date_in"
    t.string "date_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "house_id", null: false
    t.index ["house_id"], name: "index_reservations_on_house_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "houses", "users"
  add_foreign_key "reservations", "houses"
end
