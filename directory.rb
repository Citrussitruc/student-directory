students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villans Academy"
  puts "-------------------------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def while_print(students)
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names of the student and then which cohort"
  puts "To skip adding info, just press return"
  # To create an empty array
  new_cohort = []
  # To get the first name
  puts "name"
  name = gets.chomp
  puts "cohort"
  cohort = gets.chomp.to_s
  # while name is not empty, repeat this code
  while !name.empty? do
    # Add student hash to array
    new_cohort << {name: name, cohort: cohort}
    # Get another name
    puts "name"
    name = gets.chomp
    puts "cohort"
    cohort = gets.chomp.to_s
  end 
  # Return array
  new_cohort
end

def specific_letter(students)
  puts "Which letter would you like to search with"
  letter = gets.chomp
  students.select { |student| student[:name][0] == letter }.each { |student| puts student[:name] }
end

def shorter_than_12_chars(students)
  students.select { |student| student[:name].length < 12 }.each { |student| puts student[:name] }
end

# print_header
# print(students)
# print_footer(students)

# while_print(students)

# new_cohort = input_students
# print(new_cohort)


# specific_letter(students)
# shorter_than_12_chars(students)