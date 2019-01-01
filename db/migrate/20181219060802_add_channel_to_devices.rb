class AddChannelToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :channel, :string
  end
end
