class Gameboard < ActiveRecord::Base
  attr_accessible :game_round_id, :goal, :gridsize, :player1_start_position, :player2_start_position
  belongs_to :GameRound
  has_many :cellcolors
end
