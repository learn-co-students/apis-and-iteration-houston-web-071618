require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
<<<<<<< HEAD

  character_info = character_hash["results"]
=======
>>>>>>> master
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  movies = character_info.map {|charac|
    if charac["name"].downcase == character
      charac["films"]
    end
  }.flatten.compact

  #movies = movies[0]

  movies.map { |url|
    movie_url = RestClient.get(url)
    movie_hash = JSON.parse(movie_url)
  }



  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

  character_info = character_hash["results"]


  movies = character_info.map do |charac|
    if charac["name"].downcase == character
      charac["films"]
    end
  end.flatten.compact

  movies.map do |url|
    movie_url = RestClient.get(url)
    movie_hash = JSON.parse(movie_url)
  end
end
def parse_character_movies(films_hash)
    films_hash.each {|film|
    puts "Film Title: #{film["title"]}"
    puts "Episode Number: #{film["episode_id"]}"
    puts "=" * 40
    #puts films
    #binding.pry
  }
  # some iteration magic and puts out the movies in a nice list
  # character_info.map do |character|
  films_hash.map do |film|
  puts "Film Title: #{film["title"]}"
  puts "Episode Number: #{film["episode_id"]}"
  puts "*" * 40

  end

end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
