require "rest-client"
require "json"
require "pry"

def get_character_movies_from_api(character)

  #make the web request
  all_characters = RestClient.get("http://www.swapi.co/api/people/")
  character_hash = JSON.parse(all_characters)


  results = character_hash["results"]
  films = []
  results.each do |desired_character|
    if desired_character["name"].downcase == character
      return films = desired_character["films"]
    end
  end
  nil

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
  counter = 0
  films_array.collect do |film_urls|
    counter += 1
    all_films = RestClient.get(film_urls)
    pursed_films = JSON.parse(all_films)
    puts "#{counter}. #{pursed_films["title"]}"
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  if films_array == nil
    puts "#{character} is not on the list of actors."
  else
    parse_character_movies(films_array)
  end
end

# show_character_movies("Luke Skywalker")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
