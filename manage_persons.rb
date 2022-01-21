require './student'
require './teacher'

@teacher_arr = []
@student_arr = []

def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input a number]: '
    number = gets.chomp
    case number
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

def create_student
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission [Y/F]? '
    permission = gets.chomp
    case permission
    when 'Y'
      permission = true
    when 'F'
      permission = false
    end
    student = Student.new(age, classroom, name, parent_permission: permission)
    @student_arr.push(student)
    puts 'Person created succesfully'
    puts ' '
    main
  end
  
  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialty = gets.chomp
    teacher = Teacher.new(specialty, age, name)
    @teacher_arr.push(teacher)
    puts 'Person created succesfully'
    puts ' '
    main
  end

  def display_person
    puts ' '
    @student_arr.each { |x| puts "[Student] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}" }
    @teacher_arr.each { |x| puts "[Teacher] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}" }
    puts ' '
    main
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @student_arr.each do |x|
      puts "#{@student_arr.find_index(x)}) [Student] Name: #{x.name} ID: #{x.id} Age: #{x.age}"
    end
    @teacher_arr.each do |x|
      puts "#{@teacher_arr.find_index(x) + @student_arr.length}) [Teacher] Name: #{x.name} ID: #{x.id} Age: #{x.age}"
    end
  end