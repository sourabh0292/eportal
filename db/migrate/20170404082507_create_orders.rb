class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.integer :pincode
      t.integer :mobile

      t.timestamps
    end
  end
end
