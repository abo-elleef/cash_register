class CreateBasetsProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets_products do |t|
      t.integer :basket_id
      t.integer :product_id
      t.integer :items_count, default: 1
      t.float :price, default: 0.0

      t.timestamps
    end
  end
end
