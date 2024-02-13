defmodule Task4 do
  @doc """
  Searches for a key in the tuple using the binary search algorithm. It returns :not_found if the key is not in the tuple.
  Otherwise returns {:ok, index}.
  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(tuple, integer) do
    list = Tuple.to_list(tuple)
    min = 0
    max = Enum.count(list) - 1
    search(list, integer, max, min)
  end

  defp search([], _, _, _) do
    :not_found
  end

  defp search(list, integer, max, min) do
    if max >= min do
      mid = div(max + min , 2)
      cond do
        (Enum.at(list, mid) == integer) ->
          {:ok, mid}
        (Enum.at(list, mid) > integer) ->
          search(list, integer, mid - 1, min)
        true ->
          search(list, integer, max, mid + 1)
      end
    end
  end


end
