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

ActiveRecord::Schema.define(version: 20140127024833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: true do |t|
    t.string   "activity"
    t.integer  "price"
    t.string   "description"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destinations", force: true do |t|
    t.string   "destination"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "earth_weathers", force: true do |t|
    t.string   "origin"
    t.integer  "time"
    t.string   "summary"
    t.string   "icon"
    t.integer  "sunriseTime"
    t.integer  "sunsetTime"
    t.float    "moonPhase"
    t.float    "precipIntensity"
    t.float    "precipIntensityMax"
    t.float    "precipProbability"
    t.float    "temperatureMin"
    t.integer  "temperatureMinTime"
    t.float    "temperatureMax"
    t.integer  "temperatureMaxTime"
    t.float    "apparentTemperatureMin"
    t.integer  "apparentTemperatureMinTime"
    t.float    "apparentTemperatureMax"
    t.integer  "apparentTemperatureMaxTime"
    t.float    "dewPoint"
    t.float    "humidity"
    t.float    "windSpeed"
    t.integer  "windBearing"
    t.float    "visibility"
    t.float    "cloudCover"
    t.float    "pressure"
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
    t.integer  "duration"
  end

  create_table "mars_weathers", force: true do |t|
    t.string   "terrestrial_date"
    t.integer  "sol"
    t.integer  "ls"
    t.integer  "min_temp"
    t.integer  "min_temp_fahrenheit"
    t.integer  "max_temp"
    t.integer  "max_temp_fahrenheit"
    t.integer  "pressure"
    t.string   "pressure_string"
    t.integer  "abs_humidity"
    t.integer  "wind_speed"
    t.string   "wind_direction"
    t.string   "atmo_opacity"
    t.string   "season"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sunrise"
    t.string   "sunset"
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
    t.string   "propulsion"
    t.string   "plating"
  end

  create_table "trip_amenities", force: true do |t|
    t.integer  "amenity_id"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trip_amenities", ["amenity_id"], name: "index_trip_amenities_on_amenity_id", using: :btree
  add_index "trip_amenities", ["trip_id"], name: "index_trip_amenities_on_trip_id", using: :btree

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
