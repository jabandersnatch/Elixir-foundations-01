defmodule Task3 do
  @doc """
  Count the number of words in the sentence.
  Words are compared case-insensitively.
  """

  @spec count(String.t()) :: map

  def count(phrase) do
    String.downcase(phrase)
    |> String.split(~r/\s+/)
    |> count_list()
  end

  defp count_list(list) do
    count_map = %{}
    count_list(list, count_map)
  end

  defp count_list([head | tail], count_map) do
    if(Map.has_key?(count_map, head)) do
      updated_count_map = Map.update!(count_map, head, &(&1 + 1))
      count_list(tail, updated_count_map)
    else
      updated_count_map = Map.put(count_map, head, 1)
      count_list(tail, updated_count_map)
    end

  end

  defp count_list([], count_map) do
    count_map
  end
end
