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

ActiveRecord::Schema.define(version: 20170521054711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string   "details"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "splitters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amountOwing"
    t.boolean  "paid"
    t.integer  "message_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["message_id"], name: "index_splitters_on_message_id", using: :btree
    t.index ["user_id"], name: "index_splitters_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "api_token"
    t.index ["api_token"], name: "index_users_on_api_token", using: :btree
  end

  add_foreign_key "messages", "users"
  add_foreign_key "splitters", "messages"
  add_foreign_key "splitters", "users"
end
