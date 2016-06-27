@students = [] # and empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit the return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  puts "Now please enter the student's cohort month"
  cohort = gets.chomp
  #create an empty array

  #get the first name

  #while the name is empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort, hobbies: :hobby, height: :tall, country: :nation}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    puts "Please enter the names of the students"
    puts "To finish, just hit the return twice"
    name = gets.chomp
    puts "Now please enter the student's cohort month"
    cohort = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
    # 1.  print the menu and ask the user what to do
      puts "1.  Input the students"
      puts "2.  Show the students"
      puts "3.  Save students list to students.csv"
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
    when "9"
      exit # this will cause the program to exit
    else
      puts "I don't understand what you meant, try again"
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
        puts"Born in: #{student[:country]}, height:  #{student[:height]}".center(80)
        puts"Hobbies:  #{student[:hobbies]}".center(80)
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
  #open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


#nothing happens untill we call the methods
interactive_menu
