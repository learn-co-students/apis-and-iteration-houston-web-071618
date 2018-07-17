def welcome
  # puts out a welcome message here!
  "Welcome to Star Wars Search Engine!"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  search_item = gets.chomp
  search_item.downcase 

end
