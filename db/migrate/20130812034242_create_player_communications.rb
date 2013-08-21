class CreatePlayerCommunications < ActiveRecord::Migration
  def change
    create_table :player_communications do |t|
      t.integer :gameround_id
      t.integer :player_id

      t.timestamps
    end
  end
end
