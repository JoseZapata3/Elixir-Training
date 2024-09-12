defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_desk makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "Shuffling a deck ramdomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
