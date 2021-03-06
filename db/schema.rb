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

ActiveRecord::Schema.define(version: 20170418222946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "order_powers", force: :cascade do |t|
    t.integer "order_id"
    t.integer "power_id"
    t.integer "power_quantity", default: 1
    t.index ["order_id"], name: "index_order_powers_on_order_id", using: :btree
    t.index ["power_id"], name: "index_order_powers_on_power_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status",     default: "Ordered"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "powers", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.string   "image_url"
    t.integer  "category_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "status",             default: "active"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["category_id"], name: "index_powers_on_category_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "role",                  default: 0
    t.string   "address"
  end

  add_foreign_key "order_powers", "orders"
  add_foreign_key "order_powers", "powers"
  add_foreign_key "orders", "users"
  add_foreign_key "powers", "categories"
end
