class RoomsMessage < ApplicationRecord 
    belongs_to :message 
    belongs_to :room
end