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

ActiveRecord::Schema.define(version: 2019_08_22_165444) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.string "friendable_type"
    t.integer "friendable_id"
    t.integer "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "blocker_id"
    t.integer "status"
    t.index ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.integer "trip_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_items_on_trip_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
    t.float "longitude"
    t.float "latitude"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "body"
    t.integer "trip_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_posts_on_trip_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id"
    t.integer "category_id"
    t.datetime "date"
    t.integer "author_id"
    t.index ["category_id"], name: "index_trips_on_category_id"
    t.index ["location_id"], name: "index_trips_on_location_id"
  end

  create_table "trips_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "trip_id", null: false
    t.index ["trip_id", "user_id"], name: "index_trips_users_on_trip_id_and_user_id"
    t.index ["user_id", "trip_id"], name: "index_trips_users_on_user_id_and_trip_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.string "photo", default: "/assets/no.png"
    t.string "twitter"
    t.string "instagram"
  end

end
