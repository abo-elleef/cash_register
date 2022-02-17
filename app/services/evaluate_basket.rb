class EvaluateBasket
  def initialize(basket)
    @basket = basket
  end

  def perform
    @basket.baskets_products.map do |basket_product|
      evaluet_price(basket_product)
    end
    # FIXME: have better suggests for bigger customer basket
  end

  private

  def evaluet_price(basket_product)
    basket_product.price = calculate_price(basket_product).round(2)
    basket_product.save
  end

  def calculate_price(basket_product)  
    apply_discount?(basket_product) ? discounted_price(basket_product) : original_price(basket_product) 
  end

  def apply_discount?(basket_product)
    basket_product.product.discount_limit.present? &&
    basket_product.items_count >= basket_product.product.discount_limit
  end

  def original_price(basket_product)
    basket_product.items_count * basket_product.product.price 
  end
  
  def discounted_price(basket_product)
    send("apply_#{basket_product.product.discount_type}", basket_product.product, basket_product.items_count)
  end

  def apply_percentage(product, amount)
    product.price * amount * (product.discount_percentage / 100.0)
  end

  def apply_fixed(product, amount)
    amount * product.discounted_price
  end

  def apply_one_per_one(product, amount)
    if amount.even?
      product.price / 2.0 * amount 
    else
      product.price / 2.0 * (amount - 1) + product.price
    end
  end

  
end
