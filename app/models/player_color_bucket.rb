class PlayerColorBucket < ActiveRecord::Base
  attr_accessible :color_pallet_id, :game_round_id, :player_id, :original_quantity, :available_quantity
end
