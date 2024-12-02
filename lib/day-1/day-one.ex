defmodule DayOne do
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
