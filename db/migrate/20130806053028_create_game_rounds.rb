class CreateGameRounds < ActiveRecord::Migration
  def change
    create_table :game_rounds do |t|
      t.integer :game_id
      t.integer :player1_player2_emotion
      t.integer :player2_player1_emotion
      t.integer :player1_player2_expectation
      t.integer :player2_player1_expecatation

      t.timestamps
    end
  end
end
