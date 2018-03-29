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

ActiveRecord::Schema.define(version: 20180329012502) do

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

  create_table "beer_styles", force: :cascade do |t|
    t.string "name"
    t.integer "school_beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_beer_id"], name: "index_beer_styles_on_school_beer_id"
  end

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.float "abv"
    t.integer "ibu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brewery"
    t.string "nationality"
    t.string "description"
    t.string "slug"
    t.integer "beer_style_id"
    t.index ["beer_style_id"], name: "index_beers_on_beer_style_id"
  end

  create_table "checkins", force: :cascade do |t|
    t.integer "bar_id"
    t.integer "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_checkins_on_bar_id"
    t.index ["beer_id"], name: "index_checkins_on_beer_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "school_beers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
