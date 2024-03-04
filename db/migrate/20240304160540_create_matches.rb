class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :first_user, null: false
      t.references :second_user, null: false
      t.boolean :status, default: false

      t.timestamps
    end

    add_foreign_key :matches, :users, column: :first_user_id
    add_foreign_key :matches, :users, column: :second_user_id
  end
end
