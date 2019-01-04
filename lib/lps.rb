class LPs < Product
  attr_accessor :album, :group, :genre, :year

  def self.from_file(file_path)
    files = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

    self.new(
      album: files[0],
      group: files[1],
      genre: files[2],
      year: files[3].to_i,
      price: files[4].to_i,
      amount: files[5].to_i
    )
  end

  def initialize(params)
    super

    @author = params[:author]
    @title = params[:title]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "В жанре #{@genre} вышел #{@album}(#{@year}) - #{@group} #{super}"
  end
end