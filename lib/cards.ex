defmodule Cards do

  def create_deck do
    values = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","J","Q","K"]
    suits = ["Spades", "Clubs", "Hearts","Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size )
  end

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
