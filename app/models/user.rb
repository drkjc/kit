class User < ApplicationRecord 
    has_many :messages
    has_many :rooms_users 
    has_many :rooms, through: :rooms_users

    validates :name, presence: true 
    validates :email, presence: true 
    #validates_uniqueness_of :email
    validates :password_digest, presence: true
    
end