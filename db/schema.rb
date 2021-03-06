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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101006031513) do

  create_table "entries", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "family_id"
    t.string   "class_name"
    t.string   "className"
  end

  create_table "events_members", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "member_id"
  end

  add_index "events_members", ["event_id", "member_id"], :name => "index_events_members_on_event_id_and_member_id"
  add_index "events_members", ["member_id"], :name => "index_events_members_on_member_id"

  create_table "families", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "family_id"
    t.integer  "entry_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "time_zone"
    t.string   "persistence_token"
    t.datetime "last_login_at"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "class_name"
    t.string   "perishable_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
