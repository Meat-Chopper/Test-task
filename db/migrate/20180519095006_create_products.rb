class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :quantity, null: false
      t.decimal :price, null: false

      t.timestamps
    end

    add_index :products, :name, unique: true
  end
end
