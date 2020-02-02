require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'


@card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

@cards = [@card1, @card2, @card3]

@deck = Deck.new(@cards)

@round = Round.new(@deck)

@card_number = 0



def start
puts "Welcome! You're playing with #{@deck.count} cards."

puts "-------------------------------------------------"

@cards.each do |card|

puts "This is card number #{@card_number += 1} out of #{@deck.count} ."
puts @round.current_card.question

guess = gets.chomp

turn = @round.take_turn(guess)

puts turn.feedback
end

puts "****** Game over! ******"

puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct.to_i}%."

puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct."
# puts " - #{@round.percent_correct_by_category(:)}% correct."
require "pry"; binding.pry


end

p start
