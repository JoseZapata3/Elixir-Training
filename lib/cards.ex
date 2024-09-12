defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","J","Q","K"]
    suits = ["Spades", "Clubs", "Hearts","Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    mix deck elements to change the order of the cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Validates if the given card in the deck

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Two of Clubs")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `Hand_size` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size )
  end


  @doc """
    saves the current state of the deck in a binary file
  """
  def save(filename, deck) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.term_to_binary binary
      {:error,_reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
