require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/lps'
require_relative 'lib/collection'

total = 0
choice = nil

collection = Collection.from_dir(File.dirname(__FILE__) + '/data')

botique = collection.products #.each { |product| puts product } небольшая напоминалка.

until choice == 'x'
  puts "\nЧто хотите купить?\n\n"

  botique.each.with_index(1) {|product, index| print "#{index}: #{product.to_s}\n\n"}

  puts "x. Покинуть магазин\n\n"

  choice = STDIN.gets.chomp

  unless choice == 'x'
    product = botique[choice.to_i - 1]
    total += product.buy
  end
end

puts "Спасибо за покупки, с Вас #{total} рублей"