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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130211023830) do

  create_table "events", :force => true do |t|
    t.string   "title",                          :null => false
    t.string   "genre",                          :null => false
    t.string   "venue",                          :null => false
    t.string   "city",                           :null => false
    t.date     "start_date",                     :null => false
    t.date     "end_date"
    t.string   "age_group",                      :null => false
    t.integer  "run_time"
    t.text     "description",                    :null => false
    t.string   "image",                          :null => false
    t.boolean  "is_open",     :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "requests", :force => true do |t|
    t.string   "first_name", :null => false
    t.string   "last_name",  :null => false
    t.string   "email",      :null => false
    t.string   "phone"
    t.integer  "count",      :null => false
    t.text     "message"
    t.integer  "event_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string  "title",    :null => false
    t.integer "event_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.integer  "admin"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
