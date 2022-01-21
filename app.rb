require './manage_persons'
require './manage_books'
require './manage_rentals'

def sub_app(number)
    case number
    when '1'
      list_books
  
    when '2'
      display_person
  
    when '3'
      create_person
  
    when '4'
      create_book
    end
  end
  
  def sub_app2(number)
    case number
    when '5'
      create_rental
  
    when '6'
      list_rentals
  
    when '7'
      store_books
      store_students
      store_teachers
      exit_msg
    end
  end
  
  def app(number)
    sub_app(number)
    sub_app2(number)
  end