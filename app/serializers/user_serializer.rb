class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :list_titles

  def username
    object.username
  end

  def list_titles
    object.list_titles
  end
end
