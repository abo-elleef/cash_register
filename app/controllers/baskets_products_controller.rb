class BasketsProductsController < ApplicationController
  def create
    if add_product_to_basket
      evalute_basket(@basket)
      redirect_to root_path, notice: 'Item Added'
    else
      redirect_to root_path, error: "Item Can't Added"
    end
  end

  def destroy 
    if remove_product_from_basket
      evalute_basket(@basket)
      redirect_to root_path, notice: 'Item removed'
    else
      redirect_to root_path, notice: "Item Can't removed"
    end
    
  end

  private

  def evalute_basket(basket)
    @basket_details = EvaluateBasket.new(basket).perform
  end

  def add_product_to_basket
    @basket = Basket.find params[:basket_id]
    product = Product.find params[:product_id]
    basket_product_attributes = {product_id: product.id, basket_id: @basket.id}
    scope = BasketsProduct.where(basket_product_attributes)
    scope.exists? ? scope.first.increment!(:items_count) : BasketsProduct.create(basket_product_attributes)
  end

  def remove_product_from_basket
    basket_product = BasketsProduct.find params[:id]
    @basket = basket_product.basket
    if basket_product.items_count.to_f > 1
      basket_product.decrement!(:items_count)
    else
      basket_product.destroy
    end
  end
  
end