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

ActiveRecord::Schema.define(version: 20140619212824) do

  create_table "resources", force: true do |t|
    t.string   "oid"
    t.string   "retrievalURL"
    t.date     "activeFrom"
    t.date     "activeTo"
    t.string   "objectType"
    t.string   "eventType"
    t.string   "description"
    t.string   "lang"
    t.string   "license"
    t.integer  "length"
    t.string   "mimeType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["activeTo"], name: "index_resources_on_activeTo"
  add_index "resources", ["eventType"], name: "index_resources_on_eventType"
  add_index "resources", ["lang"], name: "index_resources_on_lang"
  add_index "resources", ["objectType"], name: "index_resources_on_objectType"

end
