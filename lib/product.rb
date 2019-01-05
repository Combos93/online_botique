class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    "#{@price} руб. [осталось - #{@amount}]"
  end

  def self.from_file(_file_path)
    raise NotImplementedError
  end

  def buy
    if @amount > 0
      print "* * * * * * *\n"
      puts
      puts "Вы купили товар #{self}"
      puts
      print "* * * * * * *\n"

      @amount -= 1
      price
    else
      puts 'К сожалению, больше нет'
      0
    end
  end
end