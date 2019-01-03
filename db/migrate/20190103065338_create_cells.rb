class CreateCells < ActiveRecord::Migration[5.0]
  def change
    create_table :cells do |t|
      t.integer :x
      t.integer :y
      t.string :type
      t.boolean :walkable
      t.timestamps
    end
  end
end
