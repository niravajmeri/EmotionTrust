class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :country

      t.timestamps
    end
  end
end
