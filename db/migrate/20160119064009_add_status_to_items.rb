class AddStatusToItems < ActiveRecord::Migration
  def change
    add_column :items, :status, :string, default: "incomplete"
  end
end
