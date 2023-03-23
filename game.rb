require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, archived)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    today = Time.now
    total = today.year - date.year
    total -= 1 if
        date.month > today.month or
        (date.month >= today.month and date.day > today.day)
    super && (total > 2)
  end
end
