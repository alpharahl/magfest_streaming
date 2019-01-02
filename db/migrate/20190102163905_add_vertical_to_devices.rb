class AddVerticalToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :vertical, :boolean
  end
end
