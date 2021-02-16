class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customers_id
      t.string :name
      t.string :postcode
      t.string :address
      t.integer :bill
      t.integer :shipping
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
  end
end
