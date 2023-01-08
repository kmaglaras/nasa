defmodule Nasa do
  def launch_fuel(mass, gravity) do
    trunc(mass * gravity * 0.042 - 33)
  end

  def land_fuel(mass, gravity) do
    trunc(mass * gravity * 0.033 - 42)
  end

  def additional_landing_fuel(mass, gravity, added_fuel \\ 0)

  def additional_landing_fuel(mass, gravity, added_fuel) when mass > 0 do
    fuel = land_fuel(mass, gravity)
    additional_landing_fuel(fuel, gravity, added_fuel + fuel)
  end

  def additional_landing_fuel(mass, _gravity, added_fuel) do
    added_fuel - mass
  end
end
