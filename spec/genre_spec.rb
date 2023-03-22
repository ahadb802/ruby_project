require_relative '../src/genre'

describe Genre do
  it 'has a name' do
    genre = Genre.new('Pop')
    expect(genre.name).to eq('Pop')
  end

  it 'has an empty list of items' do
    genre = Genre.new('Pop')
    expect(genre.instance_variable_get(:@items)).to be_empty
  end

  it 'adds the item to its list of items' do
    genrea = Genre.new('Pop')
    item = Item.new(DateTime.now.prev_year(10).to_time, false)
    item.genre
    genrea.add_item(item)

    expect(genrea.instance_variable_get(:@items)).to include(item)
  end

  it 'sets the genre of the item to itself' do
    genre = Genre.new('Pop')
    item = Item.new(DateTime.now.prev_year(10).to_time, false)
    genre.add_item(item)
    expect(item.genre).to eq(genre)
  end
end
