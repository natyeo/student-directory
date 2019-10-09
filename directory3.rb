@students = [] 
@filename = ""

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end 
end

def print_menu
  puts "  1. Input the students
  2. Show the students
  3. Save the list
  4. Load the list
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
    puts "What file would you like to load? If you enter nothing, students.csv will be loaded"
    @filename = STDIN.gets.chomp
    if @filename.empty? 
      @filename = "students.csv"
    end 
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
  puts "Where would you like to save to? If you enter nothing, students will be saved to students.csv"
  @filename = STDIN.gets.chomp 
  if @filename.empty? 
    @filename = "students.csv"
  end 
  file = File.open(@filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close
  puts "#{@students.count} students saved to #{@filename}"
end 

def load_students
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student_hash(name, cohort)
  end 
  file.close
  puts "loaded #{@students.count} students from #{@filename}"
end 

def startup_load_students
  @filename = ARGV.first
  if @filename.nil? 
    @filename = "students.csv"
  end 
  if !File.exists?(@filename) 
    puts "Sorry, #{@filename} doesn't exist."
    exit 
  end 
  load_students
end 

def add_student_hash(name, cohort)
  @students << {name: name, cohort: cohort.to_sym} 
end 

startup_load_students
interactive_menu
