class Product
  attr_reader :code, :name, :price, :del_price

  def initialize(code, name, price, del_price)
    @code = code
    @name = name
    @price = price
    @del_price = del_price
  end
end
