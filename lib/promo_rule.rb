class PromoRule
  attr_reader :type, :block

  TYPE = { discount: 1, multi_discount: 2 }

  def initialize(type, &block)
    @type = type
    @block = block
  end

  def apply(*args)
    case block.arity
    when 0
      block.call
    when 1
      block.call(args[0])
    when 2
      block.call(args[0], args[1])
    end
  end

  def self.discount_rule(minimum_spend, percentage_discount)
    PromoRule.new(PromoRule::TYPE[:discount]) do |sum_total|
      if sum_total >= minimum_spend
        sum_total.round(2) - sum_total.round(2)*percentage_discount/100
      else
        sum_total.round(2)
      end
    end
  end

  def self.multi_discount_rule(product_code, qualifying_quantity, discount_price)
    PromoRule.new(PromoRule::TYPE[:multi_discount]) do |code, quantity|
      if code == product_code && quantity >= qualifying_quantity
        discount_price
      end
    end
  end

end
