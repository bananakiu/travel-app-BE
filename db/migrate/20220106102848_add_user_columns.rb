class AddUserColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :bio, :string
    add_column :users, :profile_picture, :string

    add_column :users, :api_key, :string
  end
end
