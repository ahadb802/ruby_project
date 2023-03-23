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
end
