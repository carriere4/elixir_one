defmodule Cards do
  @moduledoc """
    Provides methods for creating and dealing from a deck of cards
  """
  @doc """
   Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values =  ["Ace","Two","Three","Four", "Five", "Six", "Seven", "Eight", "Nine","Ten","Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end
  @doc """
   Shuffles the deck of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines if a card is in a deck

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
   Divides a deck into a hand and the remainder of the deck.
   Deals a hand of a specific size from the deck: `hand size`

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
   Saves the deck of cards
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck) #encodes the file so it can be saved
    File.write(filename, binary)
  end

  @doc """
   loads a deck of cards
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end

  end

  @doc """
   Chains methods together to create a hand from a created, shuffled deck
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
