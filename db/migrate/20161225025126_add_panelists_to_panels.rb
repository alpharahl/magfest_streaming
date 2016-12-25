class AddPanelistsToPanels < ActiveRecord::Migration
  def change
    add_column :panels, :panelists, :string
  end
end
