class GameRound < ActiveRecord::Base
  attr_accessible :game_id, :player1_player2_emotion, :player1_player2_expectation, :player2_player1_emotion, :player2_player1_expecatation
  
  belongs_to :Game
  has_one :Gameboard
end
