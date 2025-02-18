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

ActiveRecord::Schema.define(version: 2018_11_24_202144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "facebook_users", force: :cascade do |t|
    t.bigint "facebook_id"
    t.integer "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gift_features", force: :cascade do |t|
    t.integer "strength"
    t.bigint "gift_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_gift_features_on_feature_id"
    t.index ["gift_id"], name: "index_gift_features_on_gift_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "price_cents", default: 0, null: false
    t.string "sku"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.bigint "facebook_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id"
    t.index ["facebook_user_id"], name: "index_messages_on_facebook_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "gift_sku"
    t.integer "amount_cents", default: 0, null: false
    t.json "payment"
    t.string "address"
    t.integer "unit"
    t.string "postal_code"
    t.string "city"
    t.string "country"
    t.string "province"
    t.string "phone_number"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
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

  add_foreign_key "gift_features", "features"
  add_foreign_key "gift_features", "gifts"
  add_foreign_key "messages", "facebook_users"
  add_foreign_key "orders", "users"
end
