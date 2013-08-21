class CreateTransferResources < ActiveRecord::Migration
  def change
    create_table :transfer_resources do |t|
      t.integer :game_round_id
      t.integer :player_id
      t.integer :opponent_id
      t.integer :color_pallet_id
      t.integer :quantity

      t.timestamps
    end
  end
end
