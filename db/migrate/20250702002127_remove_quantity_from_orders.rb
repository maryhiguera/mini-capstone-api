class RemoveQuantityFromOrders < ActiveRecord::Migration[8.0]
  def change
    remove_column :orders, :quantity, :integer
    remove_column :orders, :product_id, :integer
  end
end
