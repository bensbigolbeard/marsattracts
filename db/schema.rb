# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140116231517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: true do |t|
    t.string   "destination"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.string   "flight_number"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.string   "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ship_id"
    t.integer  "price"
    t.integer  "destination_id"
    t.integer  "origin_id"
  end

  create_table "origins", force: true do |t|
    t.string   "origin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postal_code"
    t.float    "lat"
    t.float    "long"
  end

  create_table "passengers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "emergency_contact"
    t.date     "date_of_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ships", force: true do |t|
    t.integer  "speed"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "trips", force: true do |t|
    t.string   "seat_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "flight_id"
    t.integer  "passenger_id"
    t.integer  "price"
  end

  add_index "trips", ["flight_id"], name: "index_trips_on_flight_id", using: :btree
  add_index "trips", ["passenger_id"], name: "index_trips_on_passenger_id", using: :btree

end
