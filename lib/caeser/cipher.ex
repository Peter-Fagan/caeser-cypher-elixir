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

  # ASCII value for A is 65, a is 97

  def calculate_mapping(base_letter, char, shift, alphabet_size \\ 26) do
    base_letter + rem(char - (base_letter - alphabet_size) - rem(shift, alphabet_size), alphabet_size)
  end

  # def calculate_mapping(base_letter, char, shift, alphabet_size \\ 26) do
  #   char + offset(shift)
  # end

  # def offset(shift) do
  # end
end
