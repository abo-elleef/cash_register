class BasketsController < ApplicationController
  def create
    @products = Product.all 
    @basket = Basket.first_or_create
  end
end