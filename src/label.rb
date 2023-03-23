require_relative 'item'

class Label
  attr_accessor :id, :color, :title, :items

  def initialize(color, title)
    @id = rand(1000..9999)
    @color = color
    @title = title
    @items = []
  end

  #   def add_item(item)
  #     @items << item
  #     item.label = self
  #   end
end
