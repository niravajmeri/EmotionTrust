class Game < ActiveRecord::Base
  attr_accessible :player1_end_mood, :player1_id, :player1_player2_end_trust, :player1_player2_start_trust, :player1_start_mood, :player2_end_mood, :player2_id, :player2_player1_end_trust, :player2_player1_start_trust, :player2_start_mood, :game_status, :number_of_rounds, :round_generate_status
  
  has_many :GameRounds
  belongs_to :player1, :class_name => "Player"
  belongs_to :player2, :class_name => "Player"
  
end
