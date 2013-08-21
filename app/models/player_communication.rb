class PlayerCommunication < ActiveRecord::Base
  attr_accessible :game_round_id, :player_id, :message
end
