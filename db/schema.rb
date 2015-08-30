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

ActiveRecord::Schema.define(version: 20150826232601) do

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "neighborhood"
    t.string   "date_type"
    t.string   "mood"
    t.string   "polaroid_description"
    t.string   "specials"
    t.string   "food_drink"
    t.string   "why_blove"
    t.string   "price_for_two"
    t.string   "hours"
    t.string   "details_table"
    t.string   "date_experience"
    t.string   "keep_in_mind"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
