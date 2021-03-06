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

ActiveRecord::Schema.define(version: 20170904150313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps", force: :cascade do |t|
    t.string   "name"
    t.integer  "account_id"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_apps_on_account_id", using: :btree
    t.index ["creator_id"], name: "index_apps_on_creator_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "encrypted_password"
    t.string   "encrypted_password_iv"
    t.integer  "account_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["account_id"], name: "index_users_on_account_id", using: :btree
  end

  add_foreign_key "apps", "accounts"
  add_foreign_key "apps", "users", column: "creator_id"
  add_foreign_key "users", "accounts"
end
