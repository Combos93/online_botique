require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/lps'
require_relative 'lib/collection'

total_price = 0
choice = nil

collection = Collection.from_dir(File.dirname(__FILE__) + '/data')

# collection.sort!(by: :title, order: :desc)
#
# price - по цене; amount - количество; title - название
# asc - по убыванию; desc - по возрастанию

botique = collection.all.each { |product| puts product }
# puts botique.size

while(choice != 'x')
  # Покажем пользователю ассортимент и предложим что-нибудь купить
  Product.showcase(botique)

  choice = STDIN.gets.chomp

  # Проверим, что пользователь выбрал какой-то продукт
  if(choice != 'x')
    # Купим продукт и увеличим стоимость покупок
    product = botique[choice.to_i]
    total_price += product.buy
  end
end

# Наконец, покажем, сколько должен пользователь
puts "Спасибо за покупки, с Вас #{total_price} руб."