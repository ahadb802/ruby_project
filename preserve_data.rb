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
