class Basket < ApplicationRecord
  has_many :baskets_products
  has_many :products, through: :baskets_products
  
  def total
    baskets_products.map(&:price).sum.to_f.round(2)
  end
  
end