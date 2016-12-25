class AddPanelsDataToPanels < ActiveRecord::Migration
  def change
    add_column :panels, :panels_data, :string
  end
end
