class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.string :name

      t.timestamps
    end
  end
end
