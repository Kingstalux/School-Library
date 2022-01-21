require './rental'
require './manage_persons'
require './manage_books'

@rental_arr = []

def create_rental
    select_books
    number = gets.chomp
    book = @book_arr[number.to_i]
    puts ' '
  
    select_person
  
    value = gets.chomp
  
    person = if value.to_i < @student_arr.length
               @student_arr[value.to_i]
             else
               @teacher_arr[value.to_i - @student_arr.length]
             end
  
    puts ' '
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rental_arr.push(rental)
    puts 'Rental created successfully'
    puts ' '
    main
  end
  
  def list_rentals
    print 'ID of person: '
    number = gets.chomp
    id_no = number.to_i
    puts 'Rentals:'
    @rental_arr.each do |x|
      puts "Date: #{x.date}, Book '#{x.book.title}' by #{x.book.author}" if x.person.id == id_no
    end
    puts ' '
    main
  end
