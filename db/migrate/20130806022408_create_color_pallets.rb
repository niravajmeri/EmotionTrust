class CreateColorPallets < ActiveRecord::Migration
  def change
    create_table :color_pallets do |t|
      t.string :color

      t.timestamps
    end
  end
end
