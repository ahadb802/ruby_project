require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :archived

  def initialize(multiplayer, last_played_at, publish_date, archived)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @games = []
  end

  def can_be_archived?()
    super && ((Date.today.year - @last_played_at.year) > 2)
  end
end
