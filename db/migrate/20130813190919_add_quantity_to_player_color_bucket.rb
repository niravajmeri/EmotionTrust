class AddQuantityToPlayerColorBucket < ActiveRecord::Migration
  def change
    add_column :player_color_buckets, :original_quantity, :integer
    add_column :player_color_buckets, :available_quantity, :integer
  end
end
