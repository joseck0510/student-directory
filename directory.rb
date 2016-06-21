student_count = 11
# let's put all the students into an array
students = [
            "Dr.  Hannibal Lecter",
            "Darth Vader",
            "Nurse Ratched",
            "Michael Corleone",
            "Alex DeLarge",
            "The Wicked Witch of the West",
            "Terminator",
            "Freddy Krueger",
            "The Joker",
            "Joffrey Baratheon",
            "Norman Bates"
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "overall, we have #{names.count} great students."
end
#nothing happends untill we call the methods
print_header
print(students)
print_footer(students)
