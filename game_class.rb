class Game < Item
  def initialize(multiplayer:, last_played_at:)
    super()
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    return false unless Item.can_be_archived? || last_played_at > 2
  end
end
