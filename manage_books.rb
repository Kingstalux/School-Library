require './book'
require 'json'

def initialize_book
    book_file = './books.json'
    f = File.read(book_file)
    if f.empty? == false
      json = JSON.parse(f)
      get_book(json)
    else
      @book_arr = []
    end
end

def get_book(json)
    @book_arr = []
    i = 0
    while i < json.length
      b = Book.new(json[i]['title'], json[i]['author'])
      @book_arr.push(b)
      i += 1
    end
end

def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @book_arr.push(book)
    puts 'Book created successfully'
    puts ' '
    main
    @book_arr
  end

  def list_books
    @book_arr.each { |x| puts "Title: '#{x.title}', Author: #{x.author}" }
    puts ' '
    main
  end

  def select_books
    puts 'Select a book from the following list by number'
    @book_arr.each { |x| puts "#{@book_arr.find_index(x)}) Title: #{x.title}, Author: #{x.author}" }
  end

  def store_books
    books_json = []
    @book_arr.each do |book|
        b = {
            'title' => book.title,
            'author' => book.author
          }
      books_json.push(b)
    end
    File.write('./books.json', books_json.to_json)
  end

  def take_book_title(title)
    i = 0
    tmp = -1
    while i < @book_arr.length
      if @book_arr[i].title == title
        tmp = @book_arr[i]
        break
      end
      i += 1
    end
    tmp
  end