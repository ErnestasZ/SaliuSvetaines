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

ActiveRecord::Schema.define(version: 20170403173611) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "date_issue"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "release_date"
  end

  create_table "stamps", force: :cascade do |t|
    t.string   "_type"
    t.string   "image"
    t.string   "name"
    t.string   "short_description"
    t.string   "stamperija_code"
    t.string   "stamp_continent"
    t.string   "stamp_country"
    t.string   "stamp_group"
    t.string   "stamp_group1"
    t.string   "stamp_group2"
    t.string   "stamp_group3"
    t.string   "stamp_year"
    t.integer  "category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "image_name"
    t.index ["category_id"], name: "index_stamps_on_category_id"
  end

end
