class Cellcolor < ActiveRecord::Base
  attr_accessible :cellnumber, :color_pallet_id, :gameboard_id
  belongs_to :Gameboard
  belongs_to :ColorPallet
end
