class Round
  attr_reader :deck, :turns
  def initialize(new_deck)
    @deck = new_deck
    @turns = []

  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.count {|turn| turn.correct?}
  end

  def number_correct_by_category(category)
    @turns.count {|turn| turn.card.category == category && turn.correct?}
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    total_number_in_category = @turns.count {|turn| turn.card.category == category}
    (total_number_in_category / number_correct_by_category(category).to_f) * 100
  end
end
