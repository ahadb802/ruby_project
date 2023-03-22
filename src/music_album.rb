require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify)
    super()
    @on_spotify = on_spotify
  end

  def can_be_archived?
    @on_spotify ? true : false
  end
end
