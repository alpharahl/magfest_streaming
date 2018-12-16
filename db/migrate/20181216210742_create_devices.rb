class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :ip
      t.string :location

      t.timestamps
    end
  end
end
