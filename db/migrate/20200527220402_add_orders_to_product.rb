class AddOrdersToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :orders, foreign_key: true
  end
end
