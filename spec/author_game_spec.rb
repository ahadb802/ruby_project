require 'date'
require_relative '../author'
require_relative '../game'

describe Author do
  context 'Author class tests' do
    author = Author.new('Michael', 'Jordan')

    describe '#new' do
      it 'returns a new object' do
        expect(author).to be_an_instance_of Author
      end

      it 'test first name' do
        expect(author.first_name).to eql 'Michael'
      end

      it 'test last name' do
        expect(author.last_name).to eql 'Jordan'
      end
    end
  end
end

describe Game do
  context 'Game class tests' do
    it 'Testing multiplayer name' do
      example_game = Game.new('multiplayer_ex', Date.new(2000, 1, 1), Date.new(2000, 1, 1), true)
      expect(example_game.multiplayer).to eql 'multiplayer_ex'
    end

    it 'sets archived to true when game is archived' do
      newgame = Game.new('multiplayer_ex', Date.new(2000, 1, 1), Date.new(2000, 1, 1), false)
      expect(newgame.instance_variable_get(:@archived)).to eq(false)
      newgame.move_to_archive
      expect(newgame.instance_variable_get(:@archived)).to eq(true)
    end

    it 'returns false for game less than 2 years old and with good cover state' do
      game = Game.new('multiplayer_ex', Date.new(2000, 1, 1), Date.today, false)
      expect(game.can_be_archived?).to be_falsy
    end

    it 'returns true for game less than 2 years old and with good cover state' do
      game = Game.new('multiplayer_ex', Date.new(2000, 1, 1), Date.new(2000, 1, 1), false)
      expect(game.can_be_archived?).to be_truthy
    end
  end
end
