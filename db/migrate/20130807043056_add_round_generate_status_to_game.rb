class AddRoundGenerateStatusToGame < ActiveRecord::Migration
  def change
    add_column :games, :round_generate_status, :boolean
  end
end
