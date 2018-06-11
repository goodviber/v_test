class DiscountManager

  attr_reader :promo_rules

  def initialize(promo_rules = [])
    @promo_rules = promo_rules
  end

  def discount_price_for(product, quantity)
    discount_price = 0

    promo_rules.each do |promo_rule|
      if promo_rule.type == PromoRule::TYPE[:multibuy_discount] #multi_discount
        discount_price = promo_rule.apply(product.code, quantity)
      end
    end
    discount_price == 0 ? product.price : discount_price
  end

  def discount_total(total)
    promo_rules.each do |promo_rule|
      if promo_rule.type == PromoRule::TYPE[:discount] # discount
        total = promo_rule.apply(total)
      end
    end
    total
  end
end
