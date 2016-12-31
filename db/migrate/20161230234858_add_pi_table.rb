class AddPiTable < ActiveRecord::Migration
  def change
    create_table :pis do |p|
      p.string :link
    end
  end
end
