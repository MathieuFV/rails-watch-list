# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'

# URL de l'API via le proxy
url = 'https://tmdb.lewagon.com/movie/top_rated'

puts "Récupération des films via l'API TMDB via le proxy du Wagon..."

begin
  serialized_data = URI.open(url).read
  movies_data = JSON.parse(serialized_data)

  movies_data['results'].first(20).each do |movie_data|
    unless Movie.exists?(title: movie_data['title'])
      Movie.create!(
        title: movie_data['title'],
        overview: movie_data['overview'],
        poster_url: "https://image.tmdb.org/t/p/original/#{movie_data['poster_path']}",
        backdrop_url: "https://image.tmdb.org/t/p/w780#{movie_data['backdrop_path']}",
        rating: movie_data['vote_average'],
        tmdb_id: movie_data['id'],
        genres_ids: movie_data['genre_ids'].join(","),
        release_date: movie_data['release_date'],
        vote_count: movie_data['vote_count']
      )
    end
  end

  puts "La base de données a été remplie à l'aide de l'API TMDB!"
rescue OpenURI::HTTPError => e
  puts "Problème lors de la récupération des films: #{e.message}"
rescue JSON::ParserError => e
  puts "Problème lors du parsing du JSON: #{e.message}"
end
