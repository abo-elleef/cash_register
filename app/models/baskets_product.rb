class BasketsProduct < ApplicationRecord
  belongs_to :basket
  belongs_to :product


  def original_price
    (items_count * product.price).round(2)
  end
end