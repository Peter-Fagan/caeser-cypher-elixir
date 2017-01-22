defmodule CaeserTest do
  use ExUnit.Case
  doctest Caeser.Cipher

  import Caeser.Cipher

  test "encrypt handles an empty string" do
    assert encrypt("", 1) == ""
  end

  test "encrypt single character with single shift" do
    assert encrypt("a", 1) == "z"
    assert encrypt("d", 1) == "c"
    assert encrypt("z", 1) == "y"
  end

  test "encrypt single character with larger shift" do
    assert encrypt("a", 5) == "v"
    assert encrypt("b", 5) == "w"
    assert encrypt("z", 5) == "u"
  end

  test "encrypt multiple character single shift" do
    assert encrypt("abcd", 1) == "zabc"
  end

  test "encrypt handles capital letters" do
    assert encrypt("abCD", 1) == "zaBC"
  end

  test "encrypt handles spaces" do
    assert encrypt("ab cd", 1) == "za bc"
  end

  test "encrypt handles a large shift number" do
    assert encrypt("abcd", 27) == "zabc"
    assert encrypt("abcd", 53) == "zabc"
  end

  test "encrypt handles a negative shift" do
    assert encrypt("a", -1) == "b"
  end

  test "encrypt handles a large negative shift" do
    assert encrypt("a", -27) == "b"
  end

  test "encrypt handles long strings" do
    assert encrypt("The quick brown fox jumps over the lazy dog", 3) == "Qeb nrfzh yoltk clu grjmp lsbo qeb ixwv ald"
  end

end


# handles long strings
