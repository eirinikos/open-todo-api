class User < ActiveRecord::Base
  has_many :lists

  validates :name, presence: true
  validates :password, presence: true

  def list_titles # see UserSerializer
    lists.map do |list|
      list.title
    end
  end
end
