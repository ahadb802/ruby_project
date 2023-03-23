require 'json'

def save_game(games)
  json_games = JSON.generate(games)
  File.exist?('games.json') ? File.open('games.json', 'w') : File.new('games.json', 'w')
  File.write('games.json', json_games)
end
