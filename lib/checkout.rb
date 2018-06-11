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
    multi_discount_price = 0
    puts basket
    basket.each do |product|
      promo_rules.each do |promo_rule|
        if promo_rule.type == PromoRule::TYPE[:multi_discount]
          multi_discount_price = promo_rule.apply(product.code, quantity_in_basket(product.code))
        end
      end
    end
    multi_discount_price
  end

  def quantity_in_basket(code)
    quantity = 0
    basket.each do |product|
      quantity +=1 if product.code == code
    end
    quantity
  end

end
