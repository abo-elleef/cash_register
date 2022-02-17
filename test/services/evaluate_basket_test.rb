require "test_helper"

class EvaluateBasketTest < ActiveSupport::TestCase
  test "must be initialized with basket" do
    assert_raises(ArgumentError) do
      EvaluateBasket.new
    end
  end

  def basket
    Basket.first_or_create
  end

  test "should calculate green tea with original value" do
    basket.baskets_products = [baskets_products(:gr_1)]
    EvaluateBasket.new(basket).perform
    assert_equal(3.11, basket.total)
  end

  test "should calculate 2 green tea with discount" do
    basket.baskets_products = [baskets_products(:gr_2)]
    EvaluateBasket.new(basket).perform
    assert_equal(3.11, basket.total)
  end

  test "should calculate 3 green tea with discount" do
    basket.baskets_products = [baskets_products(:gr_3)]
    EvaluateBasket.new(basket).perform
    assert_equal(6.22, basket.total)
  end


  test "should calculate coffee with original value" do
    basket.baskets_products = [baskets_products(:cf_1)]
    EvaluateBasket.new(basket).perform
    assert_equal(11.23, basket.total)
  end

  test "should calculate 2 coffee with original value" do
    basket.baskets_products = [baskets_products(:cf_2)]
    EvaluateBasket.new(basket).perform
    assert_equal(22.46, basket.total)
  end

  test "should calculate 3 coffee with discount" do
    basket.baskets_products = [baskets_products(:cf_3)]
    EvaluateBasket.new(basket).perform
    assert_equal(22.46, basket.total)
  end



  test "should calculate Strawberries with original value" do
    basket.baskets_products = [baskets_products(:sr_1)]
    EvaluateBasket.new(basket).perform
    assert_equal(5, basket.total)
  end

  test "should calculate 2 Strawberries with original value" do
    basket.baskets_products = [baskets_products(:sr_2)]
    EvaluateBasket.new(basket).perform
    assert_equal(10, basket.total)
  end

  test "should calculate 3 Strawberries with discount" do
    basket.baskets_products = [baskets_products(:sr_3)]
    EvaluateBasket.new(basket).perform
    assert_equal(13.5, basket.total)
  end



  test "should calculate sample baset 1 with correct values" do
    basket.baskets_products = [baskets_products(:gr_3), baskets_products(:cf_1), baskets_products(:sr_1)]
    EvaluateBasket.new(basket).perform
    assert_equal(22.45, basket.total)
  end

  test "should calculate sample baset 2 with correct values" do
    basket.baskets_products = [baskets_products(:gr_2)]
    EvaluateBasket.new(basket).perform
    assert_equal(3.11, basket.total)
  end

  test "should calculate sample baset 3 with correct values" do
    basket.baskets_products = [baskets_products(:sr_3), baskets_products(:gr_1)]
    EvaluateBasket.new(basket).perform
    assert_equal(16.61, basket.total)
  end

  test "should calculate sample baset 4 with correct values" do
    basket.baskets_products = [baskets_products(:sr_1), baskets_products(:gr_1), baskets_products(:cf_3)]
    EvaluateBasket.new(basket).perform
    assert_equal(30.57, basket.total)
  end



  
end