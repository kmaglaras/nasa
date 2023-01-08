defmodule Nasa do
  def trip(weight, destinations) do
    destinations
    |> Enum.reverse()
    |> Enum.reduce(0, fn {action, gravity}, acc ->
      additional_fuel(weight + acc, gravity, action) + acc
    end)
  end

  defp fuel_calculation(mass, gravity, :launch) do
    trunc(mass * gravity * 0.042 - 33)
  end

  defp fuel_calculation(mass, gravity, :land) do
    trunc(mass * gravity * 0.033 - 42)
  end

  defp additional_fuel(mass, gravity, action, added_fuel \\ 0)

  defp additional_fuel(mass, gravity, action, added_fuel) when mass > 0 do
    fuel = fuel_calculation(mass, gravity, action)
    additional_fuel(fuel, gravity, action, added_fuel + fuel)
  end

  defp additional_fuel(mass, _gravity, _action, added_fuel) do
    added_fuel - mass
  end
end
