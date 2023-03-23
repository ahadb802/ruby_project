require 'date'

require_relative '../src/music_album'

describe MusicAlbum do
  it 'has an on_spotify attribute' do
    album = MusicAlbum.new(true, DateTime.now.prev_year(11).to_time, false)
    expect(album.on_spotify).to eq(true)
  end

  it 'returns true when the album is not on Spotify and more than 10 years old' do
    album = MusicAlbum.new(true, DateTime.now.prev_year(11).to_time, false)
    expect(album.can_be_archived?).to eq(true)
  end

  it 'returns true when the album is on Spotify and more than 10 years old' do
    album = MusicAlbum.new(true, DateTime.now.prev_year(11).to_time, false)
    expect(album.can_be_archived?).to eq(true)
  end

  it 'returns false when the album is not more than 10 years old' do
    album = MusicAlbum.new(true, DateTime.now.prev_year(5).to_time, false)
    expect(album.can_be_archived?).to eq(false)
  end

  it 'sets archived to true when the album can be archived' do
    album = MusicAlbum.new(true, DateTime.now.prev_year(11).to_time, false)
    expect(album.instance_variable_get(:@archived)).to eq(false)
    album.move_to_archive
    expect(album.instance_variable_get(:@archived)).to eq(true)
  end

  it 'sets archived to false when the album can be can not be archived' do
    album = MusicAlbum.new(true, DateTime.now.prev_year(5).to_time, false)
    expect(album.instance_variable_get(:@archived)).to eq(false)
    album.move_to_archive
    expect(album.instance_variable_get(:@archived)).to eq(false)
  end
end
