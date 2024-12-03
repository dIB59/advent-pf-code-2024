defmodule DayOne do
  def main do
    number_list = parse_content("/Users/ibrahim/Github/advent-pf-code-2024/input_day_1.txt")
    {first_numbers, second_numbers} = accumulate(number_list)

    first_numbers = Enum.sort(first_numbers)
    second_numbers = Enum.sort(second_numbers)

    distance_list = distance(first_numbers, second_numbers)
    Enum.sum(distance_list)
  end

  def similarity do
    number_list = parse_content("/Users/ibrahim/Github/advent-pf-code-2024/input_day_1.txt")
    {first_numbers, second_numbers} = accumulate(number_list)

    first_numbers = Enum.sort(first_numbers)
    second_numbers = Enum.sort(second_numbers)

    frequencies = Enum.frequencies(second_numbers)

    Enum.map(first_numbers, fn number ->
      {number, Map.get(frequencies, number, 0)}
    end)
    |> Enum.reduce(0, fn {num, freq}, acc -> acc + num * freq end)
  end

  def accumulate(valid_list) do
    first_numbers =
      Enum.map(valid_list, fn
        [first, _] -> first
      end)

    second_numbers =
      Enum.map(valid_list, fn
        [_, second] -> second
      end)

    {first_numbers, second_numbers}
  end

  def distance(list_num1, list_num2) do
    Enum.zip(list_num1, list_num2)
    |> Enum.map(&abs(elem(&1, 0) - elem(&1, 1)))
  end

  @spec parse_content(String.t()) :: {:ok, binary()} | {:error, File.posix()}
  def parse_content(file_path) do
    case File.read(file_path) do
      {:ok, content} ->
        content
        |> String.split("\n")
        |> Enum.map(&String.split(&1, "   "))
        |> Enum.map(fn line ->
          line
          |> Enum.map(&String.trim/1)
          |> Enum.map(&parse_integer/1)
          |> Enum.reject(fn x -> x == {:error, :invalid_integer} end)
        end)
        |> Enum.reject(&Enum.empty?/1)
    end
  end

  defp parse_integer(string) do
    with {num, ""} <- Integer.parse(string) do
      num
    else
      _ -> {:error, :invalid_integer}
    end
  end
end
