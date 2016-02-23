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

ActiveRecord::Schema.define(version: 20160222210434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "game_number"
    t.date     "date"
    t.integer  "home_id"
    t.integer  "away_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "forfeit",     default: false
  end

  add_index "games", ["away_id"], name: "index_games_on_away_id", using: :btree
  add_index "games", ["home_id"], name: "index_games_on_home_id", using: :btree

  create_table "performances", force: :cascade do |t|
    t.integer  "pts"
    t.integer  "fgm"
    t.integer  "fga"
    t.integer  "tpm"
    t.integer  "tpa"
    t.integer  "ftm"
    t.integer  "fta"
    t.integer  "reb"
    t.integer  "ast"
    t.integer  "stl"
    t.integer  "blk"
    t.integer  "player_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "performances", ["game_id"], name: "index_performances_on_game_id", using: :btree
  add_index "performances", ["player_id"], name: "index_performances_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "player_number"
    t.integer  "team_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "performances", "games"
  add_foreign_key "performances", "players"
  add_foreign_key "players", "teams"
end
