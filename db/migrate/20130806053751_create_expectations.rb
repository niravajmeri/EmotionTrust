class CreateExpectations < ActiveRecord::Migration
  def change
    create_table :expectations do |t|
      t.string :name

      t.timestamps
    end
  end
end
