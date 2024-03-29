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

ActiveRecord::Schema.define(:version => 20120523143753) do

  create_table "fill_ups", :force => true do |t|
    t.integer  "vehicle_id"
    t.date     "fill_date"
    t.integer  "odometer"
    t.decimal  "gallons",         :precision => 10, :scale => 3
    t.decimal  "cost_per_gallon", :precision => 10, :scale => 3
    t.decimal  "mpg",             :precision => 10, :scale => 3
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "note"
  end

  create_table "service_items", :force => true do |t|
    t.integer  "odometer"
    t.string   "item_desc"
    t.boolean  "completed"
    t.boolean  "triggered"
    t.integer  "vehicle_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "service_items", ["vehicle_id"], :name => "index_service_items_on_vehicle_id"

  create_table "vehicles", :force => true do |t|
    t.string   "name"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "vin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
