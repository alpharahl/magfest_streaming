class AddNametoPanels < ActiveRecord::Migration
  def change
    add_column :panels, :name, :string
  end
end
