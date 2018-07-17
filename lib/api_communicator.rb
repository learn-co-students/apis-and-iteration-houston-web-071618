require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
    link_arr = []
    movie_info = []

    character_hash["results"].each do |result|
      link_arr = result["films"] if result.has_value?(character)
    end

    link_arr.each do |link|
      movie = RestClient.get(link)
      movie_info << JSON.parse(movie)
    end

    movie_info
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


def parse_character_movies(films_hash)
  films_hash.each do |data|
    puts"#{data['title']} (#{data['release_date'].split('-').first}) -#{data['director']}"
  end
  # some iteration magic and puts out the movies in a nice list
end

#title (year)/director.

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
