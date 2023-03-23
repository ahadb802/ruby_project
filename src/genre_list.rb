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

  def list_all_genres
    @genres.each do |genre|
      puts "  - name: #{genre.name}"
    end
  end

  def save_genres
    genres = @genres.map do |genre|
      {
        name: genre.name
      }
    end
    @genres_data.write(genres)
  end

  def load_genres
    puts "file_empty: #{@genres_data.file_empty}"
    puts "file_exist: #{@genres_data.file_exist}"
    puts "read: #{@genres_data.read}"

    if @genres_data.file_exist && @genres_data.file_empty == false
      puts @genres_data
      @genres_data.read.map do |genre|
        @genres << Genre.new(genre['name'])
      end
    else
      @genres_data.not_exist_create_new
    end
  end
end
