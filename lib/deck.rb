class Deck
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end

    def count
        return cards.count
    end
end