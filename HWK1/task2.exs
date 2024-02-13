defmodule Task2 do

  defstruct x: 0, y: 0, direction: :north

  @doc """
  Create a Robot Simulator given an initial direction and position.
  Valid directions are: :north, :east, :south, :west
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any

  def create(direction, {head, tail}) when direction == :north or direction == :east or direction == :south or direction == :west do
    %Task2{x: head, y: tail, direction: direction}
  end

  def create(_, {_, _}) do
    {:error, " "}
  end

  def create(_, {_}) do
    {:error, " "}
  end

  def create(_, {}) do
    {:error, " "}
  end

  @doc """
  Simulate the robot’s movement given a string of instructions.
  Valid instructions are: "R" (turn right), "L", (turn left), and "A" ( advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any

  def simulate(robot, instructions) do
    String.split(instructions, "")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.reduce(robot, fn instruction, acc_robot ->
      move(instruction, acc_robot)
    end)
  end


  defp move("L", robot) do
    move("L", robot, robot.direction)
  end

  defp move("R", robot) do
    move("R", robot, robot.direction)
  end

  defp move("A", robot) do
    move("A", robot, robot.direction)
  end

  defp move("L", robot, :north) do
    put_in(robot.direction, :west)
  end

  defp move("L", robot, :west) do
    put_in(robot.direction, :south)
  end

  defp move("L", robot, :south) do
    put_in(robot.direction, :east)
  end

  defp move("L", robot, :east) do
    put_in(robot.direction, :north)
  end


  defp move("R", robot, :north) do
    put_in(robot.direction, :east)
  end

  defp move("R", robot, :west) do
    put_in(robot.direction, :north)
  end

  defp move("R", robot, :south) do
    put_in(robot.direction, :west)
  end

  defp move("R", robot, :east) do
    put_in(robot.direction, :south)
  end

  defp move("A", robot, :north) do
    update_in(robot.y, &(&1 + 1))
  end

  defp move("A", robot, :west) do
    update_in(robot.x, &(&1 - 1))
  end

  defp move("A", robot, :south) do
    update_in(robot.y, &(&1 - 1))
  end

  defp move("A", robot, :east) do
    update_in(robot.x, &(&1 + 1))
  end

  @doc """
  Return the robot’s direction.
  Valid directions are: :north, :east, :south, :west
  """
  @spec direction(robot :: any) :: atom

  def direction(robot) do robot.direction end

  @doc """
  Return the robot’s position.
  """
  @spec position(robot :: any) :: {integer, integer}

  def position(robot) do {robot.x, robot.y} end



end
