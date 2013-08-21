class FixColumnNameInPlayerCommunication < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    rename_column :player_communications, :gameround_id, :game_round_id
  end
end
