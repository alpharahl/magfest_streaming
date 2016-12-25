class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
