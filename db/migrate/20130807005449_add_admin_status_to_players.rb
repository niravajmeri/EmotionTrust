class AddAdminStatusToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :admin_status, :boolean
  end
end
