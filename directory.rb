
def interactive_menu
  students = []
  loop do
    # 1.  print the menu and ask the user what to do
    puts "1.  Input the students"
    puts "2.  Show the students"
    puts "9.  Exit"  # 9 because we will be asking more questions
    # 2.  read the input and save it into a variable
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
      exit # this will cause the program to exit
    else
      puts "I don't understand what you meant, try again"
    end
  end
end



  def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit the return twice"
  name = gets.chomp
  puts "Now please enter the student's cohort month"
  cohort = gets.chomp
  #create an empty array

  #get the first name

  #while the name is empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: :hobby, height: :tall, country: :nation}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "Please enter the names of the students"
    puts "To finish, just hit the return twice"
    name = gets.chomp
    puts "Now please enter the student's cohort month"
    cohort = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)

    students.each_with_index do |student, index|
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

def print_footer(names)
  if names.count > 1
    puts "overall, we have #{names.count} great students."
  else
    puts "overall, we have #{names.count} great student"
  end
end
#nothing happens untill we call the methods
interactive_menu
print_header
print(students)
print_footer(students)
