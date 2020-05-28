class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.string :description
      t.integer :stock_info
      t.string :unit
      t.integer :buyers, array: true, default: []
      t.references :user, foreign_key: true
      t.references :reviews, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
