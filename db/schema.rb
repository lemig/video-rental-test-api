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

ActiveRecord::Schema.define(version: 20150321155947) do

  create_table "contents", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.text     "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
    t.integer  "season_id"
  end

  add_index "contents", ["season_id"], name: "index_contents_on_season_id"

  create_table "purchase_options", force: :cascade do |t|
    t.string   "quality"
    t.decimal  "price"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchase_options", ["content_id"], name: "index_purchase_options_on_content_id"

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "purchase_option_id"
  end

  add_index "purchases", ["purchase_option_id"], name: "index_purchases_on_purchase_option_id"
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
