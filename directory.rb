@students = []

def input_students
  puts "Please enter the names of the student and then which cohort"
  puts "To skip adding info, just press return, leave all three blank to exit"
  name, cohort, from = get_student_info
  while !name.empty? && !cohort.empty? && !from.empty? do
    insert_student(name, cohort, from)
    puts "Sucessfully added #{name}, #{cohort}, #{from}"
    name, cohort, from = get_student_info
  end
  @students
end

def get_student_info
  puts "name"
  name = STDIN.gets.chomp.capitalize
  puts "cohort"
  cohort = STDIN.gets.chomp.downcase
  puts "from"
  from = STDIN.gets.chomp.upcase
  [name, cohort, from]
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, from = line.chomp.split(',')
    insert_student(name, cohort, from)
  end
  file.close
  puts "Successfully loaded #{@students.count} students from #{filename}"
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{@filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

def insert_student(name, cohort, from)
  @students << {name: name, cohort: cohort.to_sym, from: from.to_sym}
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name],student[:cohort],student[:from]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  puts "Sucessfully saved #{@students.count} students"
end

def print_header
  puts "The students of Villans Academy".center(200)
  puts "-------------------------------".center(200)
end

def print_students_list
  i = 0
  while i < @students.length
    puts "#{i + 1}. #{@students[i][:name]}, #{@students[i][:from]} (#{@students[i][:cohort]})".center(200)
    i += 1
  end
end

def print_footer
  puts "-------------------------------".center(200)
  puts "Overall, we have #{@students.count} great students".center(200)
end

def show_students
  if @students.empty?
    puts "Add or load some students"
  else
    print_header
    print_students_list
    print_footer
  end
end

def specific_letter
  puts "Which letter would you like to search with"
  letter = gets.chomp.capitalize
  @students.select { |student| student[:name][0] == letter }.each { |student| puts student[:name] }
end

def shorter_than_12_chars
  @students.select { |student| student[:name].length < 12 }.each { |student| puts student[:name] }
end

def group_by_cohort
  puts "Which cohort would you like to view?"
  cohort = gets.chomp
  @students.each do |student|
    puts student[:name] if student[:cohort] == cohort.to_sym
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Filter students by first letter"
  puts "6. Filter students to names less than 12 characters"
  puts "7. Filter students by cohort"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    specific_letter
  when "6"
    shorter_than_12_chars
  when "7"
    group_by_cohort
  when "9"
    puts "Bye"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu