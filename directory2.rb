def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name and their personal info from the user
  name = gets.chomp
  puts "Please enter cohort"
  cohort = gets.chomp.to_sym
  if cohort.empty?
    cohort = "November".to_sym 
  end 
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort} 
    if students.count == 1
      puts "Now we have 1 student"
    else  
      puts "Now we have #{students.count} students"
    end 
      # get another name and their personal info
    puts "Please enter another name"  
    name = gets.chomp
    puts "Please enter cohort"
    cohort = gets.chomp.to_sym
  end
  # return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy by cohort".center(100)
  puts "-------------".center(100)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
  end 
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(100)
  else
    puts "Overall, we have #{students.count} great students".center(100)
  end
end

def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what to do 
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
  # 2. read the input and save it into a variable
    selection = gets.chomp
  # 3. do what the user has asked
    case selection 
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause program to terminate
    else
      puts "I don't know what you meant, try again"
  # 4. repeat from step 1
    end 
  end 
end

interactive_menu
