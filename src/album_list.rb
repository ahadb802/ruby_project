require_relative 'music_album'
require_relative 'handel_data'

class AlbumList
  def initialize
    @albums = []
    @albums_data = HandleData.new('albums')
  end

  def add_album
    puts 'The Album is on Spotify? (y/n)'
    spotify = gets.chomp
    if spotify == 'y'
      spotify = true
    elsif spotify == 'n'
      spotify = false
    end
    puts 'Please enter the publish date (YYYY-MM-DD)?'
    publish_date = gets.chomp
    puts 'Is the album archived? (y/n)'
    archived = gets.chomp
    if archived == 'y'
      archived = true
    elsif archived == 'n'
      archived = false
    end
    @albums << MusicAlbum.new(spotify, publish_date, archived)
    puts 'Music Album registered succesfully'
  end

  def list_all_albums
    @albums.each do |album|
      puts "  - spotify: #{album.on_spotify} publish date: #{album.publish_date}, archived: #{album.archived}"
    end
  end

  def save_albums
    albums = @albums.map do |album|
      {
        spotify: album.on_spotify,
        publish_date: album.publish_date,
        archived: album.archived
      }
    end
    @albums_data.write(albums)
  end

  def load_albums
    if @albums_data.file_exist && @albums_data.file_empty == false
      @albums_data.read.map do |album|
        @albums << MusicAlbum.new(album['spotify'], album['publish_date'], album['archived'])
      end
    else
      @albums_data.not_exist_create_new
    end
  end
end
