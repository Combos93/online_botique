class Book < Product
  attr_accessor :author, :title, :genre

  def self.from_file(file_path)
    files = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

    self.new(
      title: files[0],
      genre: files[1],
      author: files[2],
      price: files[3].to_i,
      amount: files[4].to_i
    )
  end

  def initialize(params)
    super

    @author = params[:author]
    @title = params[:title]
    @genre = params[:genre]
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end
end