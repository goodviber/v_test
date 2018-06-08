class PromoRule
  attr_reader :type, :block

  TYPE = { discount: 1, multi_discount: 2 }

  def initialize(type, &block)
    @type   = type
    @block  = block
  end

  def apply(*args)
    block.call(args)
  end

  def self.discount_rule(minimum_spend, percentage_discount)
    PromoRule.new(PromoRule::TYPE[:discount]) do |discount_total|
      if discount_total >= minimum_spend
        discount_total - discount_total*percentage_discount/100
      else
        discount_total
      end
    end
  end

  def self.multi_discount_rule(product_code, qualifying_quantity, discount_price)
    PromoRule.new(PromoRule::TYPE[:multi_discount]) do |code, quantity|
      if code == product_code && quantity >= qualifying_quantity
        discounted_price
      end
    end
  end

end
