class FixColumnNameInGameRound < ActiveRecord::Migration
  def up
	
  end

  def down
  end
  
  def change
    rename_column :game_rounds, :player2_player1_expecatation, :player2_player1_expectation
  end
  
end
