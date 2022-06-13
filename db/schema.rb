# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_13_133555) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.bigint "user_id"
    t.string "payer_name", null: false
    t.string "description", null: false
    t.integer "total", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "friend_one_id", null: false
    t.bigint "friend_two_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_one_id", "friend_two_id"], name: "index_friendships_on_friend_one_id_and_friend_two_id", unique: true
    t.index ["friend_one_id"], name: "index_friendships_on_friend_one_id"
    t.index ["friend_two_id"], name: "index_friendships_on_friend_two_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.string "description", null: false
    t.string "total", null: false
    t.bigint "user_id"
    t.string "payer_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_line_items_on_bill_id"
    t.index ["user_id"], name: "index_line_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "username", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "bills", "users"
  add_foreign_key "friendships", "users", column: "friend_one_id"
  add_foreign_key "friendships", "users", column: "friend_two_id"
  add_foreign_key "line_items", "bills"
  add_foreign_key "line_items", "users"
end
