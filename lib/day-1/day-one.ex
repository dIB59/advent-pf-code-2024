defmodule DayOne do

  def print_file_content do

    {content, err} = File.read("input.txt")
    IO.puts "SOmething"
    IO.puts content
    IO.puts err

  end

end
