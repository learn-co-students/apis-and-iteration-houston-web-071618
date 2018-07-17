require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  # make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  # iterate over the character hash to find the collection of `films` for the given
  star_wars = character_hash["results"]
  binding.pry
  # find character
  desired_character = star_wars.find do | current_character |
    current_character["name"].downcase == character
  end

    # return nil if character isn't found
    if(desired_character==nil)
      return nil

    else
    # return hash of all movies character is in
      movie_hash = {}
      # films is key of defined var above
      desired_character["films"].each do  | film_address |
        film_info = RestClient.get(film_address)
        character_film_hash = JSON.parse(film_info)
        movie_hash[character_film_hash["episode_id"]] = character_film_hash["title"]
        # returns the movie_hash["5"] = "episode..."
      end
    end
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  movie_hash
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end
# get_character_movies_from_api("Luke Skywalker")
# method called in show_character_movies

def parse_character_movies(films_hash)
  counter = 0
  # passing hash we created movie hash with episode and title
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do | episode_num, title |
    counter += 1
    puts "#{counter}. #{episode_num} #{title}"
  end
end
# parse_character_movies(movie_hash)
# method called below

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  if films_hash == nil
    puts "No movies found for: #{character}"
  else
  parse_character_movies(films_hash)
  end
end
# show_character_movies("Luke Skywalker")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
