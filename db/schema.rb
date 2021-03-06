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

ActiveRecord::Schema.define(version: 20141006053750) do

  create_table "bids", force: true do |t|
    t.float    "wager"
    t.string   "team"
    t.integer  "summoner_id"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.boolean  "live",        default: true
    t.float    "purple_pool", default: 0.0
    t.float    "blue_pool",   default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "winner"
  end

  create_table "matches_summoners", force: true do |t|
    t.integer "match_id"
    t.integer "summoner_id"
  end

  create_table "summoners", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profileIconId"
    t.integer  "summonerLevel"
  end

end
