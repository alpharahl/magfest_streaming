class AddStreamingToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :streaming, :boolean
  end
end
