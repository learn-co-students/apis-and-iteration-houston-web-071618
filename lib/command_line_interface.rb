def welcome
  puts "Welcome to the World of Star Wars! May the Force Be With You"
end

def get_character_from_user
  puts "please enter a character:"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp.downcase
end
