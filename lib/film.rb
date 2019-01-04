class Film < Product
  attr_accessor :title, :year, :director

  def self.from_file(file_path)
    files = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

    self.new(
      title: files[0],
      director: files[1],
      year: files[2].to_i,
      price: files[3].to_i,
      amount: files[4].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм «#{@title}», Режиссёр - #{@director}, #{@year}, #{super}"
  end
end