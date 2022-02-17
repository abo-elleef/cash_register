class AddDiscountAttributesToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discount_limit, :float
    add_column :products, :discounted_price, :float
    add_column :products, :discount_percentage, :float
    add_column :products, :discount_type, :string
  end
end