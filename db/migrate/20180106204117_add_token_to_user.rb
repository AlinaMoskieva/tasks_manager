class AddTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token, :string, unique: true, null: false
  end
end
