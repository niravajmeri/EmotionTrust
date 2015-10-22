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

ActiveRecord::Schema.define(:version => 20130826202831) do

  create_table "cellcolors", :force => true do |t|
    t.integer  "gameboard_id"
    t.integer  "cellnumber"
    t.integer  "color_pallet_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "color_pallets", :force => true do |t|
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "commitments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emotions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expectations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_rounds", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player1_player2_emotion"
    t.integer  "player2_player1_emotion"
    t.integer  "player1_player2_expectation"
    t.integer  "player2_player1_expectation"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.boolean  "game_round_status"
    t.boolean  "player1_status"
    t.boolean  "player2_status"
  end

  create_table "gameboards", :force => true do |t|
    t.integer  "game_round_id"
    t.integer  "gridsize"
    t.integer  "player1_start_position"
    t.integer  "player2_start_position"
    t.integer  "goal"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "player1_current_position"
    t.integer  "player2_current_position"
    t.integer  "player1_move_count"
    t.integer  "player2_move_count"
  end

  create_table "games", :force => true do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "player1_start_mood"
    t.integer  "player1_end_mood"
    t.integer  "player2_start_mood"
    t.integer  "player2_end_mood"
    t.integer  "player1_player2_start_trust"
    t.integer  "player1_player2_end_trust"
    t.integer  "player2_player1_start_trust"
    t.integer  "player2_player1_end_trust"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.boolean  "game_status"
    t.integer  "number_of_rounds"
    t.boolean  "round_generate_status"
  end

  create_table "moods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "player_color_buckets", :force => true do |t|
    t.integer  "game_round_id"
    t.integer  "player_id"
    t.integer  "color_pallet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "original_quantity"
    t.integer  "available_quantity"
  end

  create_table "player_communications", :force => true do |t|
    t.integer  "game_round_id"
    t.integer  "player_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "message"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "gender"
    t.string   "country"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "login_status"
    t.boolean  "admin_status"
  end

  create_table "transfer_resources", :force => true do |t|
    t.integer  "game_round_id"
    t.integer  "player_id"
    t.integer  "opponent_id"
    t.integer  "color_pallet_id"
    t.integer  "quantity"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "trusts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
