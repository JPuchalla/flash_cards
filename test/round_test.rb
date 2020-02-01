require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5°
      clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_new_deck
    assert_instance_of Round, @round
  end

  def test_round_has_a_deck
    assert_instance_of Deck, @round.deck
  end

  def test_round_has_turns
    assert_equal [], @round.turns
  end

  def test_has_current_card
    assert_equal @card1, @round.current_card
  end

  def test_turn_is_created_within_round
    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_you_can_take_multiple_turns
    @round.take_turn("Juneau")
    assert_equal 1, @round.turns.count

    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_number_correct_by_round
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

end
