class Checkout

  attr_reader :promotional_rules
  attr_accessor :cart

  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @cart = cart
  end

  def scan(item)
    cart << item
  end
  
end
