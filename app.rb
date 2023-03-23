require_relative './src/books'
require_relative 'item'
require_relative './src/label'
require 'date'

class App
  attr_reader :books

  def initialize
    @books = []
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

  def exit_app
    puts 'Thanks For Using me'
    exit
  end
end
