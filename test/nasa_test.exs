defmodule NasaTest do
  use ExUnit.Case

  test "calculates landing on Earth" do
    assert Nasa.land_fuel(28801, 9.807) == 9278
  end

  test "calculates additional landing fuel for Earth landing" do
    assert Nasa.additional_landing_fuel(28801, 9.807, 0) == 13447
  end
end
