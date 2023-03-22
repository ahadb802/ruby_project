require_relative '../author'
require_relative '../game'

RSpec.describe Author do
  before :each do
    @item = Item.new('01/01/2022', true)
    @author = Author.new(first_name: 'Michael', last_name: 'Jordan')
  end

  describe '#new' do
    it 'returns a new object' do
      @author.should be_an_instance_of Author
    end

    it 'test first name' do
      expect(@author.first_name).to eql 'Michael'
    end
  end
end
