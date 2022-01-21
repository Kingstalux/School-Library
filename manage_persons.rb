require './student'
require './teacher'
require 'json'

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

def store_students
  student_json = []
  @student_arr.each do |student|
    s = {
      'name' => student.name,
      'age' => student.age,
      'classroom' => student.classroom,
      'permission' => student.parent_permission,
      'id' => student.id
    }
    student_json.push(s)
  end
  File.write('students.json', student_json.to_json)
end

def store_teachers
  teacher_json = []
  @teacher_arr.each do |teacher|
    t = {
      'name' => teacher.name,
      'age' => teacher.age,
      'id' => teacher.id,
      'specialty' => teacher.specialization
    }
    teacher_json.push(t)
  end
  File.write('teachers.json', teacher_json.to_json)
end

def initialize_teacher
  teacher_file = './teachers.json'
  f = File.read(teacher_file)
  if f.empty? == false
    json = JSON.parse(f)
    @teacher_array = []
    get_teacher(json)
  else
    @teacher_array = []
  end
end

def initialize_student
  student_file = './students.json'
  f = File.read(student_file)
  if f.empty? == false
    json = JSON.parse(f)
    @student_array = []
    get_student(json)
  else
    @student_array = []
  end
end

def get_student(json)
  @student_arr = []
  i = 0
  while i < json.length
    s = Student.new(json[i]['age'], json[i]['classroom'], json[i]['name'], parent_permission: json[i]['permission'])
    @student_arr.push(s)
    i += 1
  end
  @student_arr
end

def get_teacher(json)
  @teacher_arr = []
  i = 0
  while i < json.length
    t = Teacher.new(json[i]['specialty'], json[i]['age'], json[i]['name'])
    @teacher_arr.push(t)
    i += 1
  end
  @teacher_arr
end

def take_person(name)
  @student_arr.each do |student|
    return student if student.name == name
  end
  @teacher_arr.each do |teacher|
    return teacher if teacher.name == name
  end
end
