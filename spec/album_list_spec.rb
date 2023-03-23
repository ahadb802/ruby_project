require_relative '../src/album_list'
require 'rspec'

RSpec.describe AlbumList do
  let(:handle_data) { instance_double('HandleData') }

  before do
    allow(HandleData).to receive(:new).with('albums').and_return(handle_data)
    allow(handle_data).to receive(:write)
  end

  describe '#add_album' do
    it 'adds a music album to the list' do
      album_list = AlbumList.new

      allow(album_list).to receive(:gets).and_return('y', '2023-03-2', 'n')
      album_list.add_album

      expect(album_list.instance_variable_get(:@albums).size).to eq(1)
    end
  end

  describe '#save_albums' do
    it 'writes album data to file using HandleData' do
      album_list = AlbumList.new
      album = instance_double('MusicAlbum', on_spotify: true, publish_date: '2023-03-23', archived: false)

      album_list.instance_variable_set(:@albums, [album])
      expect(handle_data).to receive(:write).with([{ spotify: true, publish_date: '2023-03-23', archived: false }])
      album_list.save_albums
    end
  end
end
