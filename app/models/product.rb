class Product < ApplicationRecord
  validates_presence_of :name, :code, :price
  validates_uniqueness_of :code
  has_many :baskets_products
  has_many :baskets, through: :baskets_products
end