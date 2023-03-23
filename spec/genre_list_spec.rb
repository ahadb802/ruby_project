require_relative '../src/genre_list'

describe GenreList do
  before(:each) do
    @genres_data = instance_double('HandleData')
    allow(HandleData).to receive(:new).and_return(@genres_data)
  end

  it 'adds a genre to the genre list when call add_genre' do
    genre_list = GenreList.new
    allow(genre_list).to receive(:gets).and_return('Rock')
    genre_list.add_genre
    expect(genre_list.instance_variable_get(:@genres).size).to eq(1)
  end

  it 'writes the genres to a file using HandleData when called save_genres' do
    genres_list = GenreList.new
    rock_genre = Genre.new('Rock')
    genres_list.instance_variable_get(:@genres) << rock_genre
    expected_data = [{ name: rock_genre.name }]
    expect(@genres_data).to receive(:write).with(expected_data)
    genres_list.save_genres
  end
end
