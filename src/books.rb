require_relative '../item'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_h
    {
      publisher: @publisher,
      cover_state: @cover_state,
      publish_date: @publish_date.to_s,
      archived: @archived
    }
  end
end
