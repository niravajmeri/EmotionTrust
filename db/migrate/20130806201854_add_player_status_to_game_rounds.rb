class AddPlayerStatusToGameRounds < ActiveRecord::Migration
  def change
    add_column :game_rounds, :player1_status, :boolean
    add_column :game_rounds, :player2_status, :boolean
  end
end
