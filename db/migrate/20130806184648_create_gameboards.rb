class CreateGameboards < ActiveRecord::Migration
  def change
    create_table :gameboards do |t|
      t.integer :game_round_id
      t.integer :gridsize
      t.integer :player1_start_position
      t.integer :player2_start_position
      t.integer :goal

      t.timestamps
    end
  end
end
