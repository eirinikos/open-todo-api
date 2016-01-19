class Item < ActiveRecord::Base
  belongs_to :list
  
  validates :list_id, presence: true
  validates :name, presence: true

  validates :status, inclusion: { in: %w(complete incomplete) }
end
