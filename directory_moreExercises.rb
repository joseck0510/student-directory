@students = [] # and empty array accessible to all methods
@name = ""
@cohort = ""
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit the return twice"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  puts "Now please enter the student's cohort month"
  @cohort = STDIN.gets.chomp
  while !@name.empty? do
    # add the student hash to the array
    populate_array
    puts "Now we have #{@students.count} students"
    #get another name from the user
    puts "Please enter the names of the students"
    puts "To finish, just hit the return twice"
    @name = STDIN.gets.chomp
    puts "Now please enter the student's cohort month"
    @cohort = STDIN.gets.chomp
  end
end

def load_students
  puts "Filename?"
  filename = gets.chomp
  if File.exists?(filename)

  #filename = "students.csv"
    file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
    end
  end
  else
  puts "File does not exist."
  exit
  end
end

def populate_array
  @students << {name:  @name, cohort: @cohort.to_sym}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
    # 1.  print the menu and ask the user what to do
      puts "1.  Input the students"
      puts "2.  Show the students"
      puts "3.  Save students list as a .csv file"
      puts "4.  Load the list from students.csv"
      puts "9.  Exit"  # 9 because we will be asking more question
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
      input_feedback(selection)
    when "4"
      load_students
      input_feedback(selection)
    when "9"
      exit # this will cause the program to exit
    else
      puts "I don't understand what you meant, try again"
  end
end

def input_feedback(input)
  case input
    when "3"
      puts "Working...your list is saved"
    when"4"
      puts "Working...student list is loaded"
    end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
      student.each do |name, value|
        while value.downcase[0] == 'v' && value.length < 12
        puts"#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)".center(80)
        puts
      break
      end
    end
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students."
  else
    puts "Overall, we have #{@students.count} great student"
  end
end

def save_students
  puts "Please enter filename to save as"
  filename = gets.chomp
  #open the file for writing
  filename = File.open(filename + ".csv", "w") do |filename|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      filename.puts csv_line
    end
  end
end



interactive_menu
