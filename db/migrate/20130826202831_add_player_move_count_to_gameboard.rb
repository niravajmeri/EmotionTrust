class AddPlayerMoveCountToGameboard < ActiveRecord::Migration
  def change
    add_column :gameboards, :player1_move_count, :integer
    add_column :gameboards, :player2_move_count, :integer
  end
end
