# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_22_101714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "attraction_type"
    t.integer "playersmax"
    t.string "description"
    t.integer "price"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.bigint "user_id"
    t.string "photo"
    t.index ["user_id"], name: "index_attractions_on_user_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.boolean "is_available"
    t.date "date"
    t.bigint "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_availabilities_on_attraction_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "place"
    t.bigint "attraction_id"
    t.boolean "is_validated"
    t.boolean "is_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["attraction_id"], name: "index_bookings_on_attraction_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attractions", "users"
  add_foreign_key "availabilities", "attractions"
  add_foreign_key "bookings", "attractions"
  add_foreign_key "bookings", "users"
end
