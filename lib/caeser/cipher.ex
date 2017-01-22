defmodule Caeser.Cipher do

  def encrypt(msg, shift) do
    msg
      |> to_char_list
      |> Enum.map(&shift_char(&1, shift))
      |> List.to_string
  end

  defp shift_char(char, shift) do
    case char do
      chr when chr in (?a..?z) -> calculate_mapping(?a, chr, shift)
      chr when chr in (?A..?Z) -> calculate_mapping(?A, chr, shift)
      chr -> chr
    end
  end

  def calculate_mapping(base_letter, char, shift) do
    # find ASCII integer of the char and normalize it
    # by subtracting the size of the alphabet
    # normalize = &(&1 - 26)
    # ensure shift number is within the alphabet size
    # shift_num = rem(shift, 26)
    # calculate the shifted value
    base_letter + rem(char - (base_letter - 26) - rem(shift,26), 26)
  end

  # def calculate_mapping(base_letter, char, shift, alphabet_size \\ 26) do
  #   char + offset(shift)
  # end

  # def offset(shift) do

  # end
end
