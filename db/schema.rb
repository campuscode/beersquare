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

ActiveRecord::Schema.define(version: 20180323210831) do

  create_table "bar_beers", force: :cascade do |t|
    t.integer "bar_id"
    t.integer "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_bar_beers_on_bar_id"
    t.index ["beer_id"], name: "index_bar_beers_on_beer_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "city"
    t.string "neighborhood"
    t.string "zip_code"
    t.string "phone"
    t.string "trading_hour"
    t.string "payment"
    t.string "rank"
    t.string "services"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "style"
    t.float "abv"
    t.integer "ibu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brewery"
    t.string "nationality"
    t.string "description"
  end

end
