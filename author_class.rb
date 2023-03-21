class Author
  attr_accessor :items

  def initialize(first_name:, last_name:, items:)
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(element)
    @items << element
    element.item = self
  end
end


