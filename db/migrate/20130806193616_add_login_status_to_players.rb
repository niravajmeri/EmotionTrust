class AddLoginStatusToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :login_status, :boolean
  end
end
