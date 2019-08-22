class AddUserIdColumnToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :user_id, :integer, :default => 0
  end
end
