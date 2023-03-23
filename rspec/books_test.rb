require_relative '../src/books'
require 'date'
RSpec.describe Book do
  describe '#can_be_archived?' do
    it 'returns true for books over 10 years old' do
      book = Book.new('Publisher Name', 'good', Date.new(2000, 1, 1), false)
      expect(book.can_be_archived?).to be_truthy
    end

    it 'returns true for books with bad cover state' do
      book = Book.new('Publisher Name', 'bad', Date.new(2020, 1, 1), false)
      expect(book.can_be_archived?).to be_truthy
    end

    it 'returns false for books less than 10 years old and with good cover state' do
      book = Book.new('Publisher Name', 'good', Date.today, false)
      expect(book.can_be_archived?).to be_falsy
    end
  end
end
