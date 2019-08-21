class CreateRoomsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms_users do |t|
      t.integer :user_id
      t.integer :room_id
    end
  end
end
