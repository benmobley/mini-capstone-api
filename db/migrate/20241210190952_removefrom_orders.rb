class RemovefromOrders < ActiveRecord::Migration[7.2]
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :quantity, :integer
  end
end