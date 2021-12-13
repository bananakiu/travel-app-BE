class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :image
      t.date :date
      t.string :country
      t.string :city
      t.boolean :public
      t.string :category
      t.string :category_response
      t.text :description
      t.references :roll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
