students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, from: :USA},
  {name: "Darth Vader", cohort: :november, from: :Tatooine},
  {name: "Nurse Ratched", cohort: :november, from: :USA},
  {name: "Michael Corleone", cohort: :november, from: :USA},
  {name: "Alex DeLarge", cohort: :november, from: :USA},
  {name: "The Wicked Witch of the West", cohort: :november, from: :The_West},
  {name: "Terminator", cohort: :november, from: :The_Future},
  {name: "Freddy Krueger", cohort: :november, from: :USA},
  {name: "The Joker", cohort: :november, from: :Gotham},
  {name: "Joffrey Baratheon", cohort: :november, from: :Westeros},
  {name: "Norman Bates", cohort: :november, from: :USA}
]

def print_header
  puts "The students of Villans Academy"
  puts "-------------------------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}, #{student[:from]} (#{student[:cohort]} cohort)"
  end
end

def while_print(students)
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]}, #{students[i][:from]} (#{students[i][:cohort]} cohort)"
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
print(students)
# print_footer(students)

while_print(students)

# new_cohort = input_students
# print(new_cohort)


# specific_letter(students)
# shorter_than_12_chars(students)