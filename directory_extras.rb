students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, from: :USA},
  {name: "Darth Vader", cohort: :november, from: :Tatooine},
  {name: "Nurse Ratched", cohort: :november, from: :USA},
  {name: "Michael Corleone", cohort: :november, from: :NY},
  {name: "Alex DeLarge", cohort: :november, from: :England},
  {name: "The Wicked Witch of the West", cohort: :november, from: :The_West},
  {name: "Terminator", cohort: :november, from: :The_Future},
  {name: "Freddy Krueger", cohort: :november, from: :USA},
  {name: "The Joker", cohort: :november, from: :Gotham},
  {name: "Joffrey Baratheon", cohort: :november, from: :Westeros},
  {name: "Norman Bates", cohort: :december, from: :USA}
]


def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}, #{student[:from]} (#{student[:cohort]})".center(200)
  end
end