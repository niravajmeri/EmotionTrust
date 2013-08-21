class CreateTrusts < ActiveRecord::Migration
  def change
    create_table :trusts do |t|
      t.string :name

      t.timestamps
    end
  end
end
