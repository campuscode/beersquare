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

ActiveRecord::Schema.define(version: 20180326230515) do

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
    t.string "address"
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

  create_table "checkins", force: :cascade do |t|
    t.integer "bar_id"
    t.integer "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_checkins_on_bar_id"
    t.index ["beer_id"], name: "index_checkins_on_beer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
