defmodule Nasa do
  def trip(weight, destinations) do
    destinations
    |> Enum.reverse()
    |> Enum.reduce(0, fn {action, gravity}, acc ->
      additional_fuel(weight + acc, gravity, action, 0) + acc
    end)
  end

  defp fuel_calculation(mass, gravity, :launch), do: mass * gravity * 0.042 - 33

  defp fuel_calculation(mass, gravity, :land), do: mass * gravity * 0.033 - 42

  defp additional_fuel(mass, gravity, action, added_fuel) when mass > 0 do
    fuel =
      mass
      |> fuel_calculation(gravity, action)
      |> trunc()

    additional_fuel(fuel, gravity, action, added_fuel + fuel)
  end

  # Removes mass from last iteration when fuel needed become negative
  defp additional_fuel(mass, _gravity, _action, added_fuel) do
    added_fuel - mass
  end
end
