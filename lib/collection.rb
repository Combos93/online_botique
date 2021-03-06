class Collection
  attr_reader :products, :collection

  TYPES = {
    film: {
      dir: 'films',
      class: Film
    },
    book: {
      dir: 'books',
      class: Book
    },
    lp: {
      dir: 'lps',
      class: LPs
    }
  }.freeze

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(path_to_dir)
    @collection = []

    TYPES.each do |_type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[path_to_dir + '/' + product_dir + '/*.txt'].each do |path|
        @collection << product_class.from_file(path)
      end
    end

    self.new(@collection)
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price }
    else
      @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :asc

    self
  end
end