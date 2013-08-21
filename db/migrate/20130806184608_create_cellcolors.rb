class CreateCellcolors < ActiveRecord::Migration
  def change
    create_table :cellcolors do |t|
      t.integer :gameboard_id
      t.integer :cellnumber
      t.integer :color_pallet_id

      t.timestamps
    end
  end
end
