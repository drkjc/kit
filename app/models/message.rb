class Message < ApplicationRecord 
    belongs_to :user
    has_many :rooms_messages
    has_many :rooms, through: :rooms_messages
end