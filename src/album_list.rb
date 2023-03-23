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

    puts 'Please enter the publish date?'
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
end
