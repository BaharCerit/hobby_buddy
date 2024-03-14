class ChangeStatusToString < ActiveRecord::Migration[7.1]
  def change
    change_column :matches, :status, :string
  end
end
