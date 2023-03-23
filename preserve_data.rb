require 'json'

def save_author(author)
  authors = author.map do |e|
    [
      e.id,
      e.first_name,
      e.last_name
    ]
  end
  json_author = JSON.generate(authors)
  File.exist?('data/author.json') ? File.open('data/author.json', 'w') : File.new('data/author.json', 'w')
  File.write('./data/author.json', json_author)
end

def save_game(game)
  games = game.map do |e|
    [
      e.multiplay,
      e.arhived
    ]
  end
  json_games = JSON.generate(games)
  File.exist?('data/games.json') ? File.open('data/games.json', 'w') : File.new('data/games.json', 'w')
  File.write('./data/games.json', json_games)
end
