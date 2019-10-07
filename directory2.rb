def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name and their personal info from the user
  name = gets.chomp
  puts "Please enter their date of birth"
  dob = gets.chomp
  puts "Please enter their country of birth"
  country = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
    students << {name: name, cohort: :November, dob: dob, country: country}
    puts "Now we have #{students.count} students"
  # get another name and their personal info
    puts "Please enter another name"  
    name = gets.chomp
    puts "Please enter date of birth"
    dob = gets.chomp
    puts "Please enter country of birth"
    country = gets.chomp
  end
  # return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  index = 0
  while index < students.count do 
    student = students[index]
    puts "#{index + 1}. #{student[:name]}, #{student[:dob]}, #{student[:country]} (#{student[:cohort]} cohort)"  
  index += 1
  end 
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
