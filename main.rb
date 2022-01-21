require './app'

def welcome
  puts 'Welcome to the School library App!'
  puts ' '
  initialize_book
  initialize_student
  initialize_teacher
  initialize_rentals
end

def options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def exit_msg
  puts ' '
  puts 'Thank you for using this App'
  nil
end

def main
  options
  number = gets.chomp
  app(number)
end

welcome
main
