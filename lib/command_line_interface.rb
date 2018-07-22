def welcome
  # puts out a welcome message here!
  puts "Hello! Welcome to Star Wars!"
end

def query_selection
  puts "Would you like information about a movie or a character? Enter '1' for movie or '2' for character: "
  gets.chomp
end

def get_character_from_user
  puts "Please enter a character:"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end
