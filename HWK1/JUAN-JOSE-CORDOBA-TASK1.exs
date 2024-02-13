defmodule Task1 do

  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b', and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, :equilateral} | {:error, String.t()}

  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
    {:error, " "}
  end

  def kind(a, b, c) when a + b <= c or b + c <= a or a + c <= b do
    {:error, " "}
  end

  def kind(a, b, c) when a == b and b == c do
    {:ok, :equilateral}
  end

  def kind(a, b, c) when a == b or a == c or b == c do
    {:ok, :isosceles}
  end

  def kind(_ , _, _) do
    {:ok, :scalene}
  end

end
