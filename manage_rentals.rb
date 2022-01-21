require './rental'
require './manage_persons'
require './manage_books'
require 'json'

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

def store_rentals
  rentals_json = []
  @rental_arr.each do |rental|
    r = {
      'date' => rental.date,
      'name' => rental.person.name,
      'title' => rental.book.title
    }
    rentals_json.push(r)
  end
  File.write('rentals.json', rentals_json.to_json)
end

def initialize_rentals
  rental_file = './rentals.json'
  f = File.read(rental_file)
  if f.empty? == false
    json = JSON.parse(f)
    @rental_arr = []
    get_rentals(json)
  else
    @rental_arr = []
  end
end

def get_rentals(json)
  @rental_arr = []
  i = 0
  while i < json.length
    book = take_book_title(json[i]['title'])
    date = json[i]['date']
    person = take_person(json[i]['name'])
    r = Rental.new(date, book, person)
    @rental_arr.push(r)
    i += 1
  end
end
