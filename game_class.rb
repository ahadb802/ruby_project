class Game
  def initialize(multiplayer:, last_played_at:)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end

game1 = Game.new(multiplayer: 'Records', last_played_at: '01/01/2022')
p game1
