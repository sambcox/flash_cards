require './lib/deck'
require './lib/round'
require './lib/card_generator'

class Game
  attr_reader :round, :categories_played
  def initialize(input_file)
    @input_file = input_file
    @round = Round.new(Deck.new(CardGenerator.new(@input_file).cards_inputted))
    @categories_played = []
  end

  def start
    puts "Welcome! You are playing with #{round.deck.cards.count} cards."
    puts '--------------------------------------------------'
    game_take_turn
  end

  def game_take_turn
    round.deck.cards.count.times do
      puts "This is card number #{round.card_number} out of #{round.deck.cards.count}."
      puts "Question: #{round.current_card.question}"

      unless @categories_played.include?(round.current_card.category)
        @categories_played << round.current_card.category
      end
    
      round.take_turn(gets.chomp)
      puts round.turns.last.feedback
    end
    game_over
  end
  
  def game_over
    puts '****** Game over! ******'
    puts "You had #{round.number_correct} guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct.to_i}%."

    @categories_played.each do |category_played|
      puts "#{category_played} - #{round.percent_correct_by_category(category_played)}% correct."
    end
  end
end

Game.new("./cards.txt").start


