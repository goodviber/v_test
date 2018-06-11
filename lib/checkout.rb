class Checkout
  attr_reader :promo_rules
  attr_reader :discount_manager
  attr_accessor :basket

  def initialize(promo_rules = [])
    @dicount_manager = DiscountManager.new(promo_rules)
    @promo_rules = promo_rules
    @basket = []
  end

  def scan(item)
    basket << item
  end

  def total
    price = 0
    puts basket
    basket.each do |product|
      price += product.price
    end
    price.round(2)
  end

  def quantity_in_basket(code)
    quantity = 0
    basket.each do |product|
      quantity +=1 if product.code == code
    end
    quantity
  end

end
