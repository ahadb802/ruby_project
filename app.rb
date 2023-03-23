require_relative './src/books'
require_relative 'item'
require_relative 'game'
require_relative 'author'
require_relative 'preserve_data'
require_relative './src/label'
require 'date'
require 'json'
class App
  attr_reader :books

  def initialize
    @books = []
    load_data
    @data_changed = false
    @games = []
  end

  def load_data
    return unless File.file?('books.json')

    books_data = JSON.parse(File.read('books.json'))
    books_data.each do |book|
      @books << Book.new(book['publisher'], book['cover_state'], Date.parse(book['publish_date']), book['archived'])
    end
  end

  def save_data
    return unless @data_changed

    books_data = @books.map(&:to_h)

    File.write('books.json', JSON.pretty_generate(books_data), mode: 'w')
    @data_changed = false
  end

  def list_all_books
    if @books.empty?
      puts 'No books available'
    else
      puts 'All Books:'
      @books.each do |book|
        puts "  - #{book.publisher} (#{book.cover_state})"
      end
    end
  end

  def list_all_labels
    labels = Label.new('red', 'Programmer')
    puts 'All Labels:'
    puts "  - #{labels.title} (#{labels.color})"
  end

  def add_book
    @data_changed = true
    puts "Enter the book's publisher:"
    publisher = gets.chomp
    puts "Enter the book's cover state:"
    cover_state = gets.chomp
    puts "Enter the book's publish date (YYYY-MM-DD):"
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, Date.parse(publish_date), false)
    @books << book
    puts 'Book added!'
  end

  def load_games
    return unless File.file?('games.json')

    games_data = JSON.parse(File.read('games.json'))
    games_data.each do |game|
      @games << Game.new(game['multiplayer'], Date.parse(game['last_played_at']), Date.parse(game['publish_date']), game['archived'])
    end
  end

  def games_list
    if @games.empty?
      puts 'No games available'
    else
      @games.each_with_index do |game, index|
        puts '**** Games List ****'
        puts "
        #{index} - Multiplayer: #{game.multiplayer} - Last Played at: #{game.last_played_at}"
        puts "\n"
      end
    end
  end

  def create_game
    puts 'Enter the game multiplayer: '
    multiplayer = gets.chomp
    puts 'Enter the last date it was played (YYYY-MM-DD): '
    last_played_at = gets.chomp
    puts "Enter the game's publish date (YYYY-MM-DD):"
    publish_date = gets.chomp
    puts 'Is it archived (Y/N): '
    archived = gets.chomp
    game = Game.new(multiplayer, last_played_at, publish_date, archived)
    @games << game
    games_list = @games.map do |e|
      [
        e.multiplayer,
        e.archived,
        e.publish_date,
        e.last_played_at
      ]
    end
    save_game(games_list)
    puts 'Game added!'
  end

  def authors_list
    Author.all.each_with_index do |author, index|
      puts '**** Author List ****'
      puts "
      #{index} - Name: #{author.first_name} - Last Name: #{author.last_name}"
      puts "\n"
    end
  end

  def exit_app
    save_data
    puts 'Thanks For Using me'
    exit
  end
end
