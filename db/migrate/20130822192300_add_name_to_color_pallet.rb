class AddNameToColorPallet < ActiveRecord::Migration
  def change
    add_column :color_pallets, :name, :string
  end
end
