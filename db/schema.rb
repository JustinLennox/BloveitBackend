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

ActiveRecord::Schema.define(version: 20150911053433) do

  create_table "date_stories", force: :cascade do |t|
    t.string   "storyText"
    t.boolean  "approved"
    t.integer  "user_id"
    t.string   "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fbAccessToken"
    t.text     "favorites"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "date_type"
    t.string   "mood"
    t.string   "price_rating"
    t.string   "neighborhood"
    t.string   "address"
    t.string   "polaroid_description"
    t.string   "blove_count"
    t.string   "specials"
    t.string   "food_drink"
    t.string   "why_blove_heading_1"
    t.string   "why_blove_description_1"
    t.string   "why_blove_heading_2"
    t.string   "why_blove_description_2"
    t.string   "why_blove_heading_3"
    t.string   "why_blove_description_3"
    t.string   "price_for_two"
    t.string   "monday_hours"
    t.string   "tuesday_hours"
    t.string   "wednesday_hours"
    t.string   "thursday_hours"
    t.string   "friday_hours"
    t.string   "saturday_hours"
    t.string   "sunday_hours"
    t.string   "details_table"
    t.string   "date_experience"
    t.string   "keep_in_mind"
    t.string   "crowd"
    t.string   "dress_code"
    t.string   "parking"
    t.string   "reservations"
    t.string   "atmosphere"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
