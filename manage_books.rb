require './book'

@book_arr = []

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