require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  characters_array = character_hash["results"]
  appeared_in_films = []
  characters_array.map do |character_info|
    if character == character_info["name"].downcase
      appeared_in_films << character_info["films"]
    end
  end
info_collection = ""
parsed_links = []
  appeared_in_films.each do |website|
    website.each do |link|
      info_collection = RestClient.get(link)
      parsed_links << JSON.parse(info_collection)
    end
end
parsed_links
end


def parse_character_movies(films_hash)
  films_hash.each do |film_hash|
    puts film_hash["title"]
  end
end


def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
