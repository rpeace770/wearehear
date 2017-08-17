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

ActiveRecord::Schema.define(version: 20170817223645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bouquets", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "track_id"
    t.string "custom_location"
    t.integer "location_id"
    t.datetime "expiration_date"
    t.text "comment"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer "lat"
    t.integer "lng"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "artist"
    t.string "album"
    t.string "track"
    t.integer "spotify_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
