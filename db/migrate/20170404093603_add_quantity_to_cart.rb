class AddQuantityToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :price, :integer, default: 0
  end
end
