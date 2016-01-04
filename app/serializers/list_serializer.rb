class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :items
end