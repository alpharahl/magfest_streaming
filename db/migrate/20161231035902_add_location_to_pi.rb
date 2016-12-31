class AddLocationToPi < ActiveRecord::Migration
  def change
    add_column :pis, :location, :string
  end
end
