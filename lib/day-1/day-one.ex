defmodule DayOne do
  def print_file_content do
    case File.read("input_day_1.txt") do
      {:ok, content} -> IO.puts(content)
      {:error, reason} -> IO.puts("Error: #{reason}")
    end

    case File.cwd() do
      {:ok, path} -> IO.puts("Current path: #{path}")
      {:error, reason} -> IO.puts("Error: #{reason}")
    end
  end
end
