class TransferResource < ActiveRecord::Base
  attr_accessible :color_pallet_id, :game_round_id, :opponent_id, :player_id, :quantity
end
