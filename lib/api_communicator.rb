require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  answer = nil
  filmsArray = []
  characterArray = character_hash["results"]
  characterArray.each do |character_info|
    #add a conditional to only set answer when character name == charact (the argument we passed in)
      if character_info["name"].downcase == character
      answer = character_info["films"]
      end
        #film_urls = character_info["films"]
        film_data = answer.map do |data|
        filmsArray << JSON.parse(RestClient.get(data))

      end

    end
    filmsArray

  end


def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film_thing|
    title = film_thing["title"]
    episode_id = film_thing["episode_id"]
    opening_crawl = film_thing["opening_crawl"].to_s

    puts "*" * 30
    puts title
    puts episode_id
    puts opening_crawl
    #binding.pry
  end
end


def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
