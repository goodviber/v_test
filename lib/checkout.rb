class Checkout
  attr_reader :promo_rules
  attr_reader :discount_manager
  attr_accessor :basket

  def initialize(promo_rules = [])
    @discount_manager = DiscountManager.new(promo_rules)
    @promo_rules = promo_rules
    @basket = []
  end

  def scan(item)
    basket << item
  end

  def total
    price = 0
    delivery_price = 0
    basket.each do |product|
      product_quantity = quantity_in_basket(product.code)
      price += discount_manager.discount_price_for(product, quantity_in_basket(product.code))
      delivery_price += product_quantity * product.del_price
    end

    result = discount_manager.discount_total(price)
    result += delivery_price
    result.round(2)
  end

  def quantity_in_basket(code)
    quantity = 0
    basket.each do |product|
      quantity +=1 if product.code == code
    end
    quantity
  end

end
