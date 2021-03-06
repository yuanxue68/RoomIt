# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160510031528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["post_id"], name: "index_favorites_on_post_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "post_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["post_id"], name: "index_photos_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",                          null: false
    t.text     "description",                    null: false
    t.date     "available_date"
    t.string   "home_type",                      null: false
    t.string   "room_type",                      null: false
    t.integer  "bedroom",                        null: false
    t.integer  "bathroom",                       null: false
    t.string   "apt_num"
    t.string   "street_address",                 null: false
    t.string   "city",                           null: false
    t.string   "province",                       null: false
    t.string   "postal_code",                    null: false
    t.boolean  "has_tv",                         null: false
    t.boolean  "has_kitchen",    default: false
    t.boolean  "has_air",        default: false
    t.boolean  "has_heating",    default: false
    t.boolean  "has_internet",   default: false
    t.integer  "price",                          null: false
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "posts", ["latitude", "longitude"], name: "index_posts_on_latitude_and_longitude", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "giver_id",    null: false
    t.integer  "receiver_id", null: false
    t.string   "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["giver_id"], name: "index_reviews_on_giver_id", using: :btree
  add_index "reviews", ["receiver_id"], name: "index_reviews_on_receiver_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "display_name"
    t.string   "phone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "photos", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "reviews", "users", column: "giver_id"
  add_foreign_key "reviews", "users", column: "receiver_id"
end
