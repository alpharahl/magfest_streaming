class AddlinktoRoomtopis < ActiveRecord::Migration
  def change
    add_column :pis, :room_id, :integer
  end
end
