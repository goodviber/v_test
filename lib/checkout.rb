class Checkout
  attr_reader :promo_rules
  attr_accessor :basket

  def initialize(promo_rules = [])
    @promo_rules = promo_rules
    @basket = []
  end

  def scan(item)
    basket << item
  end

  def total
    price = 0
    basket.each do |product|
      price += product.price
    end
    price
  end

end
