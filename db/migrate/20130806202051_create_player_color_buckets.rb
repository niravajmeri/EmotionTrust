class CreatePlayerColorBuckets < ActiveRecord::Migration
  def change
    create_table :player_color_buckets do |t|
      t.integer :game_round_id
      t.integer :player_id
      t.integer :color_pallet_id

      t.timestamps
    end
  end
end
