defmodule Cauzzipay.Numbers do
  def sum_all_numbers_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  # defp = define uma função PRIVADA
  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  # \/ Syntax Sugar - função de uma linha.
  defp handle_file({:error, _reason}), do: {:error, %{message: "File doesn't exists"}}
end
