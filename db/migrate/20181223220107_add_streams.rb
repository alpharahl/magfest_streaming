class AddStreams < ActiveRecord::Migration[5.0]
  def change
    create_table :streams do |t|
      t.references :room, index: true, foreign_key: true
      t.string :link

      t.timestamps null: false
    end
    add_column :streams, :streaming, :boolean
  end
end
