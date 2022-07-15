@students = []

def input_students
  puts "Please enter the names of the student and then which cohort"
  puts "To skip adding info, just press return twice."
  # To get the first name
  puts "name"
  name = gets.chomp
  puts "cohort"
  cohort = gets.chomp.to_sym
  puts "from"
  from = gets.chomp.to_sym
  # while name is not empty, repeat this code
  while !name.empty? && !cohort.empty? do
    # Add student hash to array
    @students << {name: name, cohort: cohort, from: from}
    # Get another name
    puts "name"
    name = gets.chomp
    puts "cohort"
    cohort = gets.chomp.to_sym
    puts "from"
    from = gets.chomp.to_sym
  end 
  # Return array
  @students
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

def specific_letter
  puts "Which letter would you like to search with"
  letter = gets.chomp
  @students.select { |student| student[:name][0] == letter }.each { |student| puts student[:name] }
end

def shorter_than_12_chars
  @@students.select { |student| student[:name].length < 12 }.each { |student| puts student[:name] }
end

def group_by_cohort
  puts "Which cohort would you like to view?"
  cohort = gets.chomp
  
  @students.each do |student|
    if student[:cohort] == cohort.to_sym
      puts student[:name]
    end
  end
end

def save_students
  #Open the file
  file = File.open("students.csv", "w")
  #Iterate over array
  @students.each do |student|
    student_data = [student[:name],student[:cohort],student[:from]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu