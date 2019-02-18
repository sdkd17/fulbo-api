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

ActiveRecord::Schema.define(version: 20190218213131) do

  create_table "courts", force: :cascade do |t|
    t.integer "number", null: false
    t.string "size", null: false
    t.boolean "indoor", null: false
    t.integer "local_id"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["local_id"], name: "index_courts_on_local_id"
    t.index ["number"], name: "index_courts_on_number"
    t.index ["number"], name: "index_courts_on_number_and_local", unique: true
  end

  create_table "locals", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phones"
    t.string "email", null: false
    t.time "opens", null: false
    t.time "closes", null: false
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locals_on_name"
    t.index ["owner_id"], name: "index_locals_on_owner_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["follower_id"], name: "index_relationships_on_follower_id_and_follower_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.string "phones"
    t.string "type", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["nickname"], name: "index_users_on_nickname"
  end

end
