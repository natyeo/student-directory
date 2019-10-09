@students = [] 

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end 
end

def print_menu
  puts "  1. Input the students
  2. Show the students
  3. Save the list to students.csv
  4. Load the list from students.csv
  9. Exit"
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
    puts "loading students.."
    load_students
  when "9"
    exit 
  else
    puts "I don't know what you meant, try again"
  end 
end   

def input_students
  puts "Please enter the names of the students. To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student_hash(name, "November")
    print_student_count
    puts "Please enter another name"  
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_student_count
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end 
end

def print_student_count
  puts @students.count == 1 ? "We have 1 great student" : "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
  puts "students saved"
end 

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student_hash(name, cohort)
  end 
  file.close
end 

def startup_load_students
  ARGV.first ? filename = ARGV.first : filename = "students.csv" 
  if File.exists?(filename) 
    load_students(filename)
    puts "Loaded #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end 
end 

def add_student_hash(name, cohort)
  @students << {name: name, cohort: cohort.to_sym} 
end 

startup_load_students
interactive_menu
