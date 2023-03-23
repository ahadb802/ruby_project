require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, archived, publish_date)
    super(publish_date, archived)
    @last_played_at = Date.parse(last_played_at)
    @multiplayer = multiplayer
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
