require_relative '../author'
require_relative '../game'

describe Author do
  context 'Author class tests' do
    author = Author.new(first_name: 'Michael', last_name: 'Jordan')

    describe '#new' do
      it 'returns a new object' do
        expect(author).to be_an_instance_of Author
      end

      it 'test first name' do
        expect(author.first_name).to eql 'Michael'
      end
    end
  end
end

describe Game do
  context 'Game class tests' do
    it 'Testing multiplayer name' do
      example_game = Game.new('multiplayer_ex', '10/08/2023')
      expect(example_game.multiplayer).to eql 'multiplayer_ex'
    end

    it 'sets archived to true when game is archived' do
      newgame = Game.new('multiplayer_ex', '10/08/2023')
      expect(newgame.instance_variable_get(:@archived)).to eq(false)
      newgame.move_to_archive
      expect(newgame.instance_variable_get(:@archived)).to eq(true)
    end
  end
end
