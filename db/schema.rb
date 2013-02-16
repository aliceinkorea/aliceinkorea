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
    t.string   "title",                                 :null => false
    t.string   "genre",                                 :null => false
    t.string   "venue"
    t.string   "city"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "age_group"
    t.integer  "run_time"
    t.text     "description"
    t.string   "image",                                 :null => false
    t.string   "status",      :default => "Not Active", :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "requests", :force => true do |t|
    t.string   "first_name",                               :null => false
    t.string   "last_name",                                :null => false
    t.string   "email",                                    :null => false
    t.integer  "num_tickets",                              :null => false
    t.text     "message"
    t.string   "status",      :default => "Not Processed"
    t.integer  "event_id",                                 :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string  "title",    :null => false
    t.integer "event_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                             :null => false
    t.string   "encrypted_password",                :null => false
    t.integer  "admin",              :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
