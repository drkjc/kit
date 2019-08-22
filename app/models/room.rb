class Room < ApplicationRecord 
    # extend FriendlyId
    # friendly_id :name, use: :slugged
    
    has_many :messages
    has_many :rooms_users 
    has_many :users, through: :rooms_users
end