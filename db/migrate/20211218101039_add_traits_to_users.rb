class AddTraitsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :string
    add_column :users, :profile_picture, :string # TODO: add default picture
  end
end
