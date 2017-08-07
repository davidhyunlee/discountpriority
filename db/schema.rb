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

ActiveRecord::Schema.define(version: 20170806085608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "order_no"
    t.string "sender_name"
    t.string "sender_company"
    t.string "sender_street_no"
    t.string "sender_street1"
    t.string "sender_street2"
    t.string "sender_city"
    t.string "sender_state"
    t.string "sender_zip"
    t.string "sender_country"
    t.string "sender_phone"
    t.string "sender_email"
    t.string "recipient_name"
    t.string "recipient_company"
    t.string "recipient_street_no"
    t.string "recipient_street1"
    t.string "recipient_street2"
    t.string "recipient_city"
    t.string "recipient_state"
    t.string "recipient_zip"
    t.string "recipient_country"
    t.string "recipient_phone"
    t.string "recipient_email"
    t.string "length"
    t.string "width"
    t.string "height"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_no"], name: "index_orders_on_order_no", unique: true
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "api_key"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "company"
    t.string "phone_number"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.boolean "activated"
    t.integer "role"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "orders", "users"
end
