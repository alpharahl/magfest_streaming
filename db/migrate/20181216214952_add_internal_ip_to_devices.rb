class AddInternalIpToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :internal_ip, :string
  end
end
