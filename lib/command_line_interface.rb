require "JSON"
require "rest-client"
character_data = RestClient.get("https://swapi.co/api/people/1")

JSON.parse(character_data)

def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars API!"
end

def get_character_from_user
  puts "Please enter a character to learn more: "
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
