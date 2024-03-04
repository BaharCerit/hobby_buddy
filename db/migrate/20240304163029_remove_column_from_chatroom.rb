class RemoveColumnFromChatroom < ActiveRecord::Migration[7.1]
  def change
    remove_column :chatrooms, :name
  end
end
