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

ActiveRecord::Schema[7.1].define(version: 2024_07_08_011319) do
  create_table "classifications", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "wins"
    t.integer "losses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_classifications_on_team_id"
  end

  create_table "game_players", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_players_on_game_id"
    t.index ["player_id"], name: "index_game_players_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "date"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "points"
    t.integer "rebounds"
    t.integer "assists"
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_statistics_on_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "classifications", "teams"
  add_foreign_key "game_players", "games"
  add_foreign_key "game_players", "players"
  add_foreign_key "players", "teams"
  add_foreign_key "statistics", "players"
end
