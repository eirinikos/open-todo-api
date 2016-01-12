class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :list_titles

  def password
    "#{object.name.downcase}_password"
  end

  def list_titles
    object.list_titles
  end
end
