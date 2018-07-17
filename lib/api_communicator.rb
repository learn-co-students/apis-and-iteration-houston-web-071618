require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people')
  character_hash = JSON.parse(all_characters)
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  star_wars=character_hash["results"]
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  desired_character = star_wars.find do |current_character|
    current_character["name"].downcase == character
  end

  if(desired_character==nil)
    return nil
  else
    movie_array=desired_character["films"]
    movie_hash=movie_hash_creator(movie_array)
  end
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  movie_hash

end

def movie_hash_creator(movie_array)
  movie_hash={}
  movie_array.each do |film_address|
      film_info=RestClient.get(film_address)
      character_film_hash = JSON.parse(film_info)
      movie_hash[character_film_hash["episode_id"]]=character_film_hash["title"]
  end
  movie_hash
end
# get_character_movies_from_api("Luke Skywalker")

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  counter=0
  films_hash.each do |episode_number, title|
    counter +=1
    puts  "#{counter}. episode_number:#{episode_number}  |  title:#{title}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  if films_hash == nil
    puts "No movies found for: #{character}"
  else
    parse_character_movies(films_hash)
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
