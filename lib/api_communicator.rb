require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  arr = []
  character_hash.each do |key, value| #iterates over hash
    if key == "results" #if key is result, iterate over that array
      value.each do |characters|
        #characters.each do |characteristic, parameter| #array is a list of hashes
        arr = characters["films"] if characters["name"].downcase == character.downcase
        #binding.pry
      end
    end
  end
  temp = []

  arr.each do |links|
    movies = RestClient.get(links)
    temp.push(JSON.parse(movies))
  end
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  return temp
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    # The Empire Strikes Back (1980) -
    puts film["title"] + "(" + film["release_date"] + ")" + " - " + film["director"]

  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
