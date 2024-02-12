defmodule BoutiqueInventory do

  def new() do
    [
      %{
        name: "White Shirt",
        price: 40,
        quantity_by_size: %{s: 3, m: 7, l: 8, xl: 4}
      },
      %{
        name: "Black Shirt",
        price: 30,
        quantity_by_size: %{s: 5, m: 9, l: 3, xl: 2}
      },
      %{
        name: "Blue Shirt",
        price: 35,
        quantity_by_size: %{s: 4, m: 5, l: 2, xl: 19}
      },
      %{
        name: "Jean",
        price: 70,
        quantity_by_size: %{s: 5, m: 1, l: 3, xl: 0}
      },
      %{
        name: "White pants",
        price: 65,
        quantity_by_size: %{s: 5, m: 15, l: 2, xl: 2}
      },
      %{
        name: "Black Pants",
        price: 70,
        quantity_by_size: %{s: 3, m: 7, l: 8, xl: 4}
      }
    ]
  end

  def add_item(inventory, item) do
    inventory ++ [item]
  end

  def add_size(inventory, item_name, new_size, quantity) do
    obtain_item(inventory, item_name)
    |> then(fn(x) -> x.quantity_by_size end)
    |> Map.put_new(new_size, quantity)

  end

  def remove_size(inventory, item_name, size) do
    item_to_update = obtain_item(inventory, item_name)
    if item_to_update do
      updated_quantity_by_size = Map.delete(item_to_update.quantity_by_size, size)
      Enum.map(inventory, fn item ->
        if item.name == item_name do
          %{item | quantity_by_size: updated_quantity_by_size}
        else
          item
        end
      end)
    else
      "The item doesn't exist in the inventory"
    end
  end

  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item ->
      is_nil(item.price) or item.price == 0
    end)
  end

  def increase_quantity(inventory, item_name, n) do
    Enum.reduce(inventory, nil, fn item, acc ->
      if item.name == item_name do
        updated_item = update_in(item[:quantity_by_size], fn sizes ->
          Enum.map(sizes, fn {size, qty} -> {size, qty + n} end)
          |> Map.new()
        end)
        updated_item
      else
        acc
      end
    end)
  end

  defp obtain_item([head | tail], item_name) do
    if(head.name != item_name) do
      obtain_item(tail, item_name)
    else
      head
    end
  end

  defp obtain_item([], item_name) do
  end
end
