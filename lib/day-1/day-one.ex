defmodule DayOne do
  def main do
    number_list = parse_content("/Users/ibrahim/Github/advent-pf-code-2024/input_day_1.txt")
    {first_numbers, second_numbers} = accumulate(number_list)

    Enum.sort(first_numbers)
    Enum.sort(second_numbers)

    distance_list = distance(first_numbers, second_numbers)
    Enum.sum(distance_list)
  end

  def accumulate(list) do
    first_numbers = Enum.map(list, fn [first, _] -> first end)
    second_numbers = Enum.map(list, fn [_, second] -> second end)
    {first_numbers, second_numbers}
  end

  def distance(list_num1, list_num2) do
    IO.inspect()

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
        end)

      {:error, reason} ->
        {:error, reason}
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
