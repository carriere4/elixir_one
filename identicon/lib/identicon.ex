defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end


  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    ##this now into argument: %Identicon.Image{hex: [r, g, b | _tail]} = image
    #can pattern match as we receive argument
    #can pattern match the argument list as much as we would like and receive argument at same time
    ## we no longer need this code ->[r, g, b | _tail] = hex_list
    %Identicon.Image{image | color: {r, g, b}} #image is unmodified, creates new struct with image + rgb
  end


  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end


end
