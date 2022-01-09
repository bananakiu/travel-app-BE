class AddImageToRolls < ActiveRecord::Migration[6.1]
  def change
    add_column :rolls, :image, :string
  end
end
