class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer_name, null: false
      t.string :customer_phone, null: false
      t.json :order, null: false

      t.timestamps
    end
  end
end
