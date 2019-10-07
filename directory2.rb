def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name and their personal info from the user
  name = gets.delete("\n")
  puts "Please enter cohort"
  cohort = gets.delete("\n").to_sym
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
    name = gets.delete("\n")
    puts "Please enter cohort"
    cohort = gets.delete("\n").to_sym
  end
  # return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy by cohort".center(100)
  puts "-------------".center(100)
end

def print(students)
  group_by_cohort = {}
  students.each { |student| 
    c = student[:cohort]
    if group_by_cohort[c] == nil
      group_by_cohort[c] = []
    end
    group_by_cohort[c].push(student[:name])
  }
  puts group_by_cohort.to_a
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(100)
  else
    puts "Overall, we have #{students.count} great students".center(100)
  end
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
