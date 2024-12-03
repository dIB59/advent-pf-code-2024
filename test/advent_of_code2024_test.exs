defmodule AdventOfCode2024Test do
  use ExUnit.Case
  doctest DayOne
  doctest AdventOfCode2024

  test "parses file content" do
    result = DayOne.parse_content("/Users/ibrahim/Github/advent-pf-code-2024/input_day_1.txt")

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

  test "calculate distace" do
    numbers1 = [
      14872,
      86182,
      43656,
      85315,
      90834
    ]

    numbers2 = [
      53906,
      35867,
      61313,
      23620,
      96434
    ]

    expected_distance = [39034, 50315, 17657, 61695, 5600]

    res = DayOne.distance(numbers1, numbers2)

    assert res == expected_distance
  end

  test "accumalate" do
    numbers = [
      [53906, 14872],
      [35867, 86182],
      [61313, 43656],
      [23620, 85315],
      [96434, 90834]
    ]

    numbers1 = [14872, 86182, 43656, 85315, 90834]
    numbers2 = [53906, 35867, 61313, 23620, 96434]

    res = DayOne.accumulate(numbers)

    assert res == {numbers2, numbers1}
  end

  test "main" do
    x = DayOne.main()
    assert x == 1_873_376
  end

  test "similarity" do
    x = DayOne.similarity()
    assert x == 18_997_088
  end
end
