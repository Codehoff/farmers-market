class AddBuyerToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :buyer, :string
  end
end
