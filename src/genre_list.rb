require_relative 'genre'
require_relative 'handel_data'

class GenreList
  def initialize
    @genres = []
    @genres_data = HandleData.new('genres')
  end

  def add_genre
    puts 'Please add the genre'
    genre_name = gets.chomp

    @genres << Genre.new(genre_name)
    puts 'Genre registered succesfully'
  end

  def save_genres
    genres = @genres.map do |genre|
      {
        name: genre.name
      }
    end
    @genres_data.write(genres)
  end
end
