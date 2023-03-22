require './item'

class Genre
  attr_accessor :name

  def initialize(name)
    @id = Time.now.to_f.to_s
    @name = name
    @items = []
  end
end
