class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :price_per_unit
      t.integer :total_price
      t.references :user,  foreign_key: true
      t.references :product,  foreign_key: true

      t.timestamps
    end
  end
end
