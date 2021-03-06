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

ActiveRecord::Schema.define(version: 20161203221730) do

  create_table "episodes", force: :cascade do |t|
    t.integer  "podcast_id"
    t.string   "status",      null: false
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "producer_id"
  end

  create_table "file_uploads", force: :cascade do |t|
    t.integer  "episode_id"
    t.string   "name"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcasts", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "podcasts", ["client_id"], name: "index_podcasts_on_client_id"

  create_table "users", force: :cascade do |t|
    t.string   "type"
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["password_digest"], name: "index_users_on_password_digest"
  add_index "users", ["producer_id"], name: "index_users_on_producer_id"

end
