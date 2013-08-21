class AddPlayerCurrentPositionToPlayers < ActiveRecord::Migration
  def change
    add_column :gameboards, :player1_current_position, :integer
    add_column :gameboards, :player2_current_position, :integer
  end
end
