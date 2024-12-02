defmodule AdventOfCode2024Test do
  use ExUnit.Case
  doctest DayOne
  doctest AdventOfCode2024

  test "parses file content" do
    result = DayOne.parse_content("/Users/ibrahim/Github/advent-pf-code-2024/input_day_1.txt")
    IO.inspect(result)
    # Expected numbers to assert against
    expected_numbers = [
      [53906, 14872],
      [35867, 86182],
      [61313, 43656],
      [23620, 85315],
      [96434, 90834]
    ]

    flat_result = Enum.flat_map(result, fn x -> x end)
    flat_expected = Enum.flat_map(expected_numbers, fn x -> x end)

    # Assert that the result matches the expected structure
    assert Enum.all?(flat_expected, fn number -> number in flat_result end)
  end
end
