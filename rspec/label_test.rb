require_relative '../src/label'
require 'date'

describe Label do
  describe '#add_item' do
    it 'adds the item to the label' do
      label = Label.new('red', 'example label')
      item = Item.new(Date.new(2010, 1, 1), false)
      label.add_item(item)
      expect(label.items).to eq([item])
    end

    it 'sets the label of the item to itself' do
      label = Label.new('red', 'example label')
      item = Item.new(Date.new(2010, 1, 1), false)
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end
