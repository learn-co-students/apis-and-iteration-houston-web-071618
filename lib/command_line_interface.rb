def welcome
  # puts out a welcome message here!
  puts "Welcome to Star Wars Search Engine!"

end

def get_character_from_user
  puts "please enter a character"
  search_term = gets.chomp
  search_term.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end

