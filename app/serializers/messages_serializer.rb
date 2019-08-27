class MessagesSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :room
end
