class Author
  attr_reader :items

  def initialize(first_name:, last_name:, items:)
    @first_name = first_name
    @last_name = last_name
    @items = items
  end
end
