class AddMatchIdToChatroom < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :match, null: false, foreign_key: true
  end
end
