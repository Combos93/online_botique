class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    "#{@price} руб. (осталось #{@amount})"
  end

  def self.from_file(_file_path)
    raise NotImplementedError
  end
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  def show
    "#{self} - #{@price} руб. [осталось: #{@amount}]"
  end
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  def self.showcase(products)
    puts
    puts "Что хотите купить?\n\n"

    products.each_with_index do |product, index|
      puts "#{index}: #{product.to_s}"
    end

    # К выводу витрины добавим инструкцию, как закончить покупки
    puts "x. Покинуть магазин\n\n"
  end

  def buy
    if @amount > 0
      puts "* * *"
      puts "Вы купили товар #{self}"
      puts "* * *\n\n"

      @amount -= 1
      price
      # elsif @amount += ((@amount.size) + 1)
    else
      puts "К сожалению, больше нет"
      0
    end
  end

  # def self.product_types
  #   [Books, Films, LPs]
  # end
end