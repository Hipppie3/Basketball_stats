# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_01_031316) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.date "game_date"
    t.string "matchup"
    t.string "w_l"
    t.decimal "ppg"
    t.decimal "rbg"
    t.decimal "apg"
    t.decimal "spg"
    t.decimal "bpg"
    t.integer "fgm"
    t.integer "fga"
    t.decimal "fg_percentage"
    t.integer "two_pm"
    t.integer "two_pa"
    t.integer "three_pm"
    t.integer "three_pa"
    t.integer "oreb"
    t.integer "dreb"
    t.integer "reb"
    t.integer "ast"
    t.integer "stl"
    t.integer "blk"
    t.integer "to"
    t.integer "pts"
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_statistics_on_player_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_videos_on_player_id"
  end

  add_foreign_key "statistics", "players"
  add_foreign_key "videos", "players"
end
