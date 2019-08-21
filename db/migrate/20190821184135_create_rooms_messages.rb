class CreateRoomsMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms_messages do |t|
      t.integer :message_id
      t.integer :room_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
