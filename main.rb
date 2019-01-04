require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/collection'

current_path = File.dirname(__FILE__)

film = Film.from_file(current_path + '/data/films/1.txt')
book = Book.from_file(current_path + '/data/books/1.txt')

puts film
puts book
puts
collection = Collection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :title, order: :desc)

# price - по цене; amount - количество; title - название
# asc - по убыванию; desc - по возрастанию

collection.to_a.each { |product| puts product }
