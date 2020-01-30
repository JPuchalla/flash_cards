require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def test_turn_it_exists
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_card
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal card, turn.card
  end

  def test_it_has_a_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Saturn", turn.guess
  end

  def test_is_correct
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    incorrect_turn = Turn.new("Saturn", card)
    correct_turn = Turn.new("Mercury", card)

    assert_equal false, incorrect_turn.correct?
    assert_equal true, correct_turn.correct?
  end

  def test_provide_feedback
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    incorrect_turn = Turn.new("Saturn", card)
    correct_turn = Turn.new("Mercury", card)

    assert_equal "Incorrect.", incorrect_turn.feedback
    assert_equal "Correct.", correct_turn.feedback
  end
end
