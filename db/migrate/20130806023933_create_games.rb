class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.integer :player1_start_mood
      t.integer :player1_end_mood
      t.integer :player2_start_mood
      t.integer :player2_end_mood
      t.integer :player1_player2_start_trust
      t.integer :player1_player2_end_trust
      t.integer :player2_player1_start_trust
      t.integer :player2_player1_end_trust

      t.timestamps
    end
  end
end
