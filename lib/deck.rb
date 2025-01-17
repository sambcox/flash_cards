class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end
  
  def cards_in_category(category)
    @cards.select do |card|
      card.category.downcase == category.downcase
    end
  end
end
