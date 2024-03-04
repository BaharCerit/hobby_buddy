class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :address, :text
    add_column :users, :description, :text
  end
end
