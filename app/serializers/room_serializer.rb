class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :messages

  has_many :messages
end
