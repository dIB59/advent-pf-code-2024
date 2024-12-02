defmodule AdventOfCode2024Test do
  use ExUnit.Case
  doctest DayOne
  doctest AdventOfCode2024

  test "prints the file" do
    DayOne.print_file_content()
  end
end
