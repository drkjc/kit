class Room < ApplicationRecord 
    has_many :rooms_users 
    has_many :users, through: :rooms_users
    has_many :rooms_messages 
    has_many :messages, through: :rooms_messages
end