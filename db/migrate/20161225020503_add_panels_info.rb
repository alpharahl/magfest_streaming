class AddPanelsInfo < ActiveRecord::Migration
  def change
    add_column :panels, :start_unix, :date
    add_column :panels, :start, :string
    add_column :panels, :duration, :integer
    add_column :panels, :description, :string
    add_column :panels, :location, :string
    add_column :panels, :end, :string
    add_column :panels, :end_unix, :date
  end
end
