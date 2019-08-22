class AddColumnToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :dm_id, :integer, :default => 0
  end
end
