class AddMessageToPlayerCommunications < ActiveRecord::Migration
  def change
    add_column :player_communications, :message, :text
  end
end
